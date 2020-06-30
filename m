Return-Path: <SRS0=q/iZ=AL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C87C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2020 07:04:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C71206CB
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2020 07:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C71206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqAJI-00049M-CR; Tue, 30 Jun 2020 07:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZbO=AL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqAJH-00049H-O1
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 07:04:03 +0000
X-Inumbo-ID: e0897bba-ba9f-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0897bba-ba9f-11ea-8496-bc764e2007e4;
 Tue, 30 Jun 2020 07:04:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C4F3AAC3;
 Tue, 30 Jun 2020 07:04:01 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/displif: Protocol version 2
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-2-andr2000@gmail.com>
 <84d975e3-0cea-becb-f505-856368a63fb7@suse.com>
 <e6266bcc-fe03-f1cd-2a0f-40f128813b78@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bbee8578-ee3c-f249-8c80-c2e47fc72ce0@suse.com>
Date: Tue, 30 Jun 2020 09:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e6266bcc-fe03-f1cd-2a0f-40f128813b78@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.06.20 08:13, Oleksandr Andrushchenko wrote:
> On 6/29/20 10:02 AM, Jürgen Groß wrote:
>> On 20.05.20 11:04, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> 1. Change protocol version from string to integer
>>>
>>> Version string, which is in fact an integer, is hard to handle in the
>>> code that supports different protocol versions. To simplify that
>>> make the version an integer.
>>>
>>> 2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE
>>>
>>> There are cases when display data buffer is created with non-zero
>>> offset to the data start. Handle such cases and provide that offset
>>> while creating a display buffer.
>>>
>>> 3. Add XENDISPL_OP_GET_EDID command
>>>
>>> Add an optional request for reading Extended Display Identification
>>> Data (EDID) structure which allows better configuration of the
>>> display connectors over the configuration set in XenStore.
>>> With this change connectors may have multiple resolutions defined
>>> with respect to detailed timing definitions and additional properties
>>> normally provided by displays.
>>>
>>> If this request is not supported by the backend then visible area
>>> is defined by the relevant XenStore's "resolution" property.
>>>
>>> If backend provides extended display identification data (EDID) with
>>> XENDISPL_OP_GET_EDID request then EDID values must take precedence
>>> over the resolutions defined in XenStore.
>>>
>>> 4. Bump protocol version to 2.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>>    xen/include/public/io/displif.h | 83 +++++++++++++++++++++++++++++++--
>>>    1 file changed, 80 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
>>> index cc5de9cb1f35..4d43ba5078c8 100644
>>> --- a/xen/include/public/io/displif.h
>>> +++ b/xen/include/public/io/displif.h
>>> @@ -38,7 +38,7 @@
>>>     *                           Protocol version
>>> ******************************************************************************
>>>     */
>>> -#define XENDISPL_PROTOCOL_VERSION     "1"
>>> +#define XENDISPL_PROTOCOL_VERSION     2
>>
>> This is not very nice regarding compatibility.
>>
>> Can't you add a new macro for the integer value?
> 
> We can leave it as is, e.g. define XENDISPL_PROTOCOL_VERSION as "2",
> 
> so we do not break the existing users. Then if every user of the header has
> 
> its local copy (this is what we now use in the display backend), then that
> local copy can be changed in a way suitable for the concrete user, e.g. "2"
> 
> redefined to 2. This cannot be done (?) for the Linux Kernel though.
> 
> Or we can have
> 
> #define XENDISPL_PROTOCOL_VERSION     "2"
> 
> #define XENDISPL_PROTOCOL_VERSION_INT  2
> 
> Jurgen, what's your preference here?

I would prefer the latter, as it avoids the need to modify the header
when copying it to a local project.


Juergen

