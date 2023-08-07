import joi from "joi";

const shortenSchema = joi.object({
  url: joi.tring().uri().required()
});

export default shortenSchema