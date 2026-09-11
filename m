Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30827C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417333.1646207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52g9-0006Vs-D9; Fri, 11 Sep 2026 14:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417333.1646207; Fri, 11 Sep 2026 14:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52g9-0006Vl-9i; Fri, 11 Sep 2026 14:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1417333;
 Fri, 11 Sep 2026 14:56:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1x52g8-0006Vf-O2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:56:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52g7-00BpzR-Fp
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:56:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6aa41686-2eae-0a2a0a5409dd-0a2a45098eb6-26
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:56:35 +0200
Received: from [74.125.224.140] (helo=mail-yx2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6aa416a2-be1a-0a2a45090019-4a7de08ced15-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:56:35 +0200
Received: by mail-yx2-f12.google.com with SMTP id
 956f58d0204a3-66e50968489so757707d50.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:56:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1789138594; cv=none;
        d=google.com; s=arc-20260327;
        b=iDTm61XoKeTzdArQy05fylQmVfl/6ANV46XovzGoXIjhgv6O/brRVzun9xgZ5kDsXD
         SvPTJFGa9NxPjz2AfpYclZi8P2SX3H4zWMyYx3VxuXPPL5Kyf9RHlfcyvbBoaIM8WV93
         hu96pZUSqcJxn6EE1UZRw5BRQnkizHstxP1ie2dzT+IcMcvKYit2/nh8HBT02gJKt2fH
         JiQzqf0T1p7ojLoLN7bd513PwUz0cGHvoJXsjD7B4+VJlWVaoDuMs6Qbah9LzeeKvLmI
         PmIFOs0vVNPKVH+ULVBVjGc2lUaasRaEsWrqcoQDMk8yWtnAjWqCAQvtqsMyZcXjgmd0
         h0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5t14kjtkJw6ulLvN85ahqL+1Cufqnue3EYxXJNtvEUE=;
        fh=lNAFjZRvc7d+Hys6mAVRVcmyXKosSTF0IjpuRL0sAdI=;
        b=VlUTiubbuBz0ITM3YiNKfl59zupOEjUGM76F+0qEOhR/MgKXy02+29z4Ywr/+d+VmG
         wzmHM0mXOrtPiNtszv9JsNq3gfEA62s+2ZlDkCy106yJLwtuWpFJldgnHrSU4OLQi2H2
         PmM6omDa3XfV0nxHyrZaltJ416RNyxztkApvt7ARPHCYL0x2i/zt+kQo9tSBzkphkR3z
         upvjXZMnxlPWl4qsyW68aZ6U5C7NGsRaYbAYWF2uXTpbqVlPnNkKuwmgYsdDWi99yH37
         QknvMlMSk33L7b4a6n+j0T/rbJ5FujA1Zh/ztqkQo8z/iO0PdpcdEAmWQmObD7OPhbRL
         CBag==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789138594; x=1789743394; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5t14kjtkJw6ulLvN85ahqL+1Cufqnue3EYxXJNtvEUE=;
        b=BDdU+KEcpg2MYnJDIasESD182A8E73lqBuJ21GUS/9qgoOIkcpzGqbx3W6fR9GRwKG
         2RoXf4/RfpyWlzARKw5j+7WZHBskc/wmfvz4D2bs2iWl4i9Ila/okikiMZdQvxL+Bwk7
         x4ktOr1/4mXsQeBX7yNBa1y5VpBrwpZ9nsmD9hxXDVe4IrUfsox+Y7JrcmcpDUhGNdtM
         BnHL/arVz0pqWmjKL7oxuJ4y4YeRk8QKpBj96mGcqQ0oCIIeqh8Rocy7AOHzBd6I8Fhw
         1KLJlX0BhEswJNe7wp41snrPL/MbiGVZVfCn1TiKDkUoRAg5cDvS2qGU6+S7qFSw20zS
         Q3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138594; x=1789743394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t14kjtkJw6ulLvN85ahqL+1Cufqnue3EYxXJNtvEUE=;
        b=WEUwibUx4DS2IHouCM7nTVEtPt2bhrFH8JE0XeaCKf03gk3u/u5IVCcOQYB76D4W5k
         qujV1uAZEukkdW3GSUx/I/4qEWKIjaBt7TQ4H4FOFCZlYmh/i6Hgep+pvZMSslzxOvOK
         bTa8NyW16vxjnirlAPKtMo1lD40aKIXhrhshT29i72xWAYZ8OslnCGFgmejHiWG3SYrY
         qnqhzLD9X1GBd1umGQQc/erA8vHiT6Rmk/GdiqZn8KYgEox3Jjw321mtZAtvs0JSOuns
         OfsYTdz5f08uVOHXLbg/HsaSg6yDeeJAITuS74b5/8Re/dVUIONpiWuyr+yQ1VvgnRTk
         TUJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJptW8CXX5fULQDdbzzUkspHbqzxT9Oi+Q6V5p25bt1RQ455YLRgOvnpkIETQHtzuxb2xYq/Baf1M=@lists.xenproject.org
X-Gm-Message-State: AFuF++mE4rWAgif75DHxdSAUBS6/EztEx3Mtqadhk8NdLsDl+tVquZHm
	GP+Zhk/4Vt4gk5eueiTBRiy5DB98+rtAuVbLNaU8jrxj4ECJDHGpBUZm4eg3aq6C7Bkr5YC71gX
	5BylQ9Fro9SIEyRe/pdkD3xJMyf1q8kzCzst4+DHXiQ==
X-Gm-Gg: AYBFou0o9QbmkyaH0Tr7QqfOaa/9+x5aPsVjcs+U/JP8Tau2d5PynlbQMAjAv6WqljU
	Ga5KXvFdkMLewKcUYbH+H3Q02l/2m61i4yYi6T9xvZ2yvCgjQOt1j/9d4AZbZjahZ/iaRzzHEBD
	j6b9WJI7/ikddCT3+PaKcshFlsIHEJPhROPfc8wzxDIpeCX6d5mUntI74cGz6AjZbPNhjAXq80P
	qTrKTzMps2NgDEipY77ztfFqIiTSvAgop+B/4rtb6TOOJ8ZQZRoSD6e4RQeXh/T3JI+0Cq1Rn6f
	UkOU0gqz4ymuYnTNFKeloe3PaxHS7IusamLAAAmDZBqy62f5IWdZ47hdsr9WOJ9NIhKV8QMp2nE
	vt5EqBO53b/hO3J22OeAdS0Tc4asYJ+9xH5HqEZU=
X-Received: by 2002:a05:690e:16a0:b0:66d:2cd9:91d with SMTP id
 956f58d0204a3-67124752923mr1952365d50.50.1789138593729; Fri, 11 Sep 2026
 07:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <30ec634b6072ac23c38a6a05bf3f90de4b383632.camel@infradead.org> <c9a719c9a67c9a32ad566a0255d24722e760a622.camel@infradead.org>
In-Reply-To: <c9a719c9a67c9a32ad566a0255d24722e760a622.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Sep 2026 15:56:22 +0100
X-Gm-Features: AcwNN1WWJyP_KhXTQufc5rB9sU8U7M0jxAg592d46t3fVacxoF6HjMSZN-YPQQQ
Message-ID: <CAFEAcA9WAARKjyim9HkYWQA9L45L27NNhxvCVw6CkH5d9pgiYw@mail.gmail.com>
Subject: Re: [BUG] hw/xen: features published after InitWait since 240cc11369fc
To: David Woodhouse <dwmw2@infradead.org>
Cc: mark.syms@citrix.com, qemu-devel@nongnu.org, 
	xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	anthony@xenproject.org, paul@xen.org, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1789138595-BFED6034-84260997/0/0
X-purgate-type: clean
X-purgate-size: 1949

On Fri, 11 Sept 2026 at 15:39, David Woodhouse <dwmw2@infradead.org> wrote:
> I wasn't *actually* setting out to comment on the AI policy today  =E2=80=
=94 in
> fact I didn't really have a strong opinion on it. I spend enough of my
> life tilting at windmills *intentionally*; this wasn't meant to be one
> of them.
>
> Letting the tool reply in its own voice and pretending I was held
> hostage was mostly meant as a joke, as *well* as being the only way I
> was going to look at that bug today (it would have taken me a *long*
> time to do all that testing of old and new failure modes, finding the
> net device path that *does* reproduce it locally, fixing the other
> problem with that, and finally confirming that it all works).

Even our current strict AI policy is fine with using them as tools
to help in debugging, testing, and so on. What I am complaining
about is not that you did that, but that you posted an enormous
long apparently unedited pile of output from the LLM, rather than
using it to do the work and then posting your conclusions. That
is asking readers of the thread to do a lot of work for you
(i.e. wading through the huge email to figure out whether the LLM
output is right, wrong or irrelevant).

> But our policies should be based on actual data and the holistic
> outcomes they achieve, and this is just data which we can take into
> account on one side of the balance, even if the other side remains more
> compelling.

Yes. I view that email as pretty strong data for 'even a policy
shift which says "we're OK with accepting some kinds of AI
generated code" should still be pretty strong on "text intended
for humans to read (docs, commit messages, mailing list posts, etc)
should be written by humans"'. I think that review commentary on
Paolo's RFC about a less strict policy tended to be in that direction,
so I don't think I'm completely out on a limb here.

thanks
-- PMM

