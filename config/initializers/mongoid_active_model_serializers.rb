# Rails doesn't look for serializers named after the controller when using mongoid till now
# @see http://autonomousmachine.com/posts/2012/5/5/use-active-model-serializers-with-mongoid
# TODO re-evaluate from time to time whether this is still needed
Mongoid::Document.send(:include, ActiveModel::SerializerSupport)
Mongoid::Criteria.delegate(:active_model_serializer, to: :to_a)