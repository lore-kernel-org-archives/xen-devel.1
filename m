Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8FC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:46:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380828.1624520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXSI-00034v-Rc; Sun, 02 Aug 2026 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380828.1624520; Sun, 02 Aug 2026 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXSI-00034o-Oq; Sun, 02 Aug 2026 14:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1380828;
 Sun, 02 Aug 2026 14:46:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXSG-00034i-Uw
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXSG-00Bx6q-5q
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:46:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5830-bab6-0a2a0a5309dd-0a2a450bc278-8
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:46:19 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5839-b7e8-0a2a450b0019-888fbc33527e-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:46:19 +0200
Received: by mx.zohomail.com with SMTPS id 1785681972445252.2089444850145;
 Sun, 2 Aug 2026 07:46:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785681976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HRDJ5TU4A/2Q+ugBz1yN3EHE5j2GRSNS/7EVriDnj+UeFvsH0y5Y8lyneUxhVwAN3v10S2v0Gg8q/ORNriJ3S7+e1xyUkjD4k3GmQGHSgdeHtR/IRdEz36nVIt7w1SfmUMdEaRrowdjC+OfVwDUgoLb633hDf4YKMVnsB+hE1yI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785681976; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kzbKdiqKfTJpZx1LkDJ90vqeYWH3KR+8s82icRqzEnw=; 
	b=BK4MqGoQVy07at+Ah2nTYuVntosF2cvhw/jT4RvmmIXiNXBfoSQmcKbFf+amG2IXDBxa5CrZs2EQeMmdkcle0BP59sFjZMFxRY8sblJmaig8V7DapFIG/9qFrEk1sHAm8zf4FNBxs+nwZHrxbII5QM6QpZDLSRCsgZvrKmtq1kw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785681976;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kzbKdiqKfTJpZx1LkDJ90vqeYWH3KR+8s82icRqzEnw=;
	b=tAJgAZScKoeyvnl5f7/f+E4z8skg8wsJntAfaO7HHZWXvlS9lv9+K1J81sMxKaF5
	LEeMd6+xnaYtFcYIzjAX69Sfi6n++EoknqOjudo2Pb0WQla1u/XuSFI9yMtn0F8rMqZ
	iuk+WFWRFXm50qjF2py3MpUYGCDWKXpYZj0suDGI=
Message-ID: <7a406302-5b29-4b21-8a00-12bcae460c74@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:46:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] XSM: reduce redundancy in hook machinery
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
 <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
 <8030ff8e-ed83-46c4-ba69-4954ee645c38@suse.com>
 <19775f5b-e458-4336-92a3-8f8103708564@apertussolutions.com>
 <8b4568ef-1fe7-4a3f-b1b4-a3175ebe62d9@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8b4568ef-1fe7-4a3f-b1b4-a3175ebe62d9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-42698a/1785681979-1B4D39EA-85CB4AC8/0/0
X-purgate-type: clean
X-purgate-size: 1614



On 7/31/26 4:03 AM, Jan Beulich wrote:
> On 30.07.2026 20:21, Daniel P. Smith wrote:
>> On 7/30/26 11:18 AM, Jan Beulich wrote:
>>> On 30.07.2026 17:05, Daniel P. Smith wrote:
>>>> On 7/28/26 9:13 AM, Jan Beulich wrote:
>>>>> Hooks not taking xsm_default_t as first argument could of course be
>>>>> adjusted to take one, at which point they could be covered here as well.
>>>>> Question is why there is this difference in the first place.
>>>>
>>>> I have a theory but I am not confident to write it down. I can see if I
>>>> can confirm with DDG if you really care that much to know the why.
>>>> Personally having a consistent hook interface convention would provide a
>>>> simpler pattern for people to follow if they are having to introdcue a
>>>> new hook.
>>>
>>> Well, I don't really need to know the reason. If you agree that making
>>> things uniform is a good move, I can simply stick a few more patches at
>>> the end of this series.
>>
>> Correct me if I am wrong, but we would be introducing an unused
>> parameter in exchange for uniform interfaces that can be generated with
>> machinery reducing hook maintenance overhead. IMHO I feel from a
>> security standpoint this would be a win. Would you disagree?
> 
> Definitely not. What I'm unsure is whether I'd call this a security related
> win. To me it's more a win in maintainability in general. Which of course
> (typically) also helps security of the resulting code.

That's what I was intending in that statement, Reducing fragility in 
code/maintenance increases stability and thus security.

v//r,
dps


