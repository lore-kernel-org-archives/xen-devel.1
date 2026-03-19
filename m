Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAA9109022A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 13:59:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257245.1551675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Du3-00083Q-FZ; Thu, 19 Mar 2026 13:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257245.1551675; Thu, 19 Mar 2026 13:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Du3-00083J-Cw; Thu, 19 Mar 2026 13:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1257245;
 Thu, 19 Mar 2026 13:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8/X=BT=bounce.vates.tech=bounce-md_30504962.69bc0125.v1-56268facd5384e7a914350456adb2df6@srs-se1.protection.inumbo.net>)
 id 1w3Du1-00083D-GT
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:59:09 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c922968b-239b-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:59:03 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fc6kF5gLHzP0JtWF
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 13:59:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 56268facd5384e7a914350456adb2df6; Thu, 19 Mar 2026 13:59:01 +0000
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
X-Inumbo-ID: c922968b-239b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773928741; x=1774198741;
	bh=07HNrv671SakICxDqeiUIKxDtm1tOrpaHYUe9rlFD2o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U5SnYUhDLSeYUxAshdZYfO6eP8/2UGrn1tUlamQZNv/qstrf+pxUeLDzCSx+fJsmJ
	 pXNQ16779FLb9P+cU1t2e7PMqmLSgSXDmr/vJe/B6MLVquJoyjV7u85IA3zBZhzEDg
	 AXzg3SYnel5DR0thBdaWUHXUY3GmIRr3+DSDZgrGdgJSi1ucGyVV5pZC3hLkOB4Kmt
	 PI175QomhuYQ/amn9xhJBWfH5YRmvZsyJN3l9m7PMAzIEDodwK/eGS3/T8ppVFzVgg
	 qbKetV2vIKOHh8XaAQvjeVeq8El/+wQrL7IEraTzXDPVPaFssVcfDDryW3gg+vdzXx
	 0YgjnMdCq725A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773928741; x=1774189241; i=thierry.escande@vates.tech;
	bh=07HNrv671SakICxDqeiUIKxDtm1tOrpaHYUe9rlFD2o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LClZKX6CRd8sctdoKqZC0cVPHpKJzlakU2KPnW5Ufbn4KnuzbTrifNVtfb4TOHPW+
	 WE2mri4jWRc7tCZ7XAFHry0/py3RGznn2txhCPLOq6hIcHZHhsw1ilJ2hFNR5DVaUt
	 x4inHZz7qiReg7NSLZUf66lYCrxc8s9oqY9aIOUvoqEAclabSchhQ6OW0QcaeMi8+m
	 dtRt6I3q1pmCsc/cKD8vL4X5SXXF5CXO3pFxwaPw23KEdYvOABOPDvq4x7GmE1TI3e
	 T+zJm0W9yXuoiSN+PIsPf4VROaisxw5kXdXW7hQPRWGpUjAzyaDK7pFmCCU+0iNz/t
	 NAwTCHdfJJyfg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20install.sh:=20Preserve=20directory=20symlinks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773928741100
Message-Id: <79295381-5d8a-4f78-95d2-fd67da25ccb2@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech> <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com> <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech> <929c9e0e-c465-447d-ba65-30053051a88e@suse.com>
In-Reply-To: <929c9e0e-c465-447d-ba65-30053051a88e@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.56268facd5384e7a914350456adb2df6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 13:59:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 3/19/26 14:48, Jan Beulich wrote:
> On 19.03.2026 14:26, Thierry Escande wrote:
>>
>>
>> On 3/19/26 10:31, Jan Beulich wrote:
>>> On 13.03.2026 18:25, Thierry Escande wrote:
>>>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>>>> symlinks. Using the tar option --keep-directory-symlink preserves these
>>>> symlinks.
>>>>
>>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>>> ---
>>>>  install.sh | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/install.sh b/install.sh
>>>> index 3e11c4d46f..5d0b7a4933 100644
>>>> --- a/install.sh
>>>> +++ b/install.sh
>>>> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>>>>  echo "Installing Xen from '$src' to '$dst'..."
>>>>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>>>>  
>>>> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
>>>> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
>>>
>>> How compatible (between flavors of tar as well as between versions of GNU
>>> tar) is use of this option?
>>
>> It's supported by GNU tar since version 1.27 (from ~12 years ago) but it
>> seems to be the only implementation that supports it. BSD and busybox
>> don't support it. I didn't check for other implementations.
>>
>> I can add a flavor/version check if that makes sense.
> 
> Possibly. One question then is what the behavior was prior to that option
> having been introduced.

From the patch at [1] introducing the option, and more precisely the
test done at [2], directory symlinks were simply overwritten.

[1]
https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=2c06a80918019471876956eef4ef22f05c9e0571
[2]
https://cgit.git.savannah.gnu.org/cgit/tar.git/tree/src/extract.c?id=2c06a80918019471876956eef4ef22f05c9e0571#n934

Regards,
Thierry


--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


