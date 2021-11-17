Return-Path: <SRS0=zQ2v=QE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B067C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 17 Nov 2021 11:45:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58A061BD4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Nov 2021 11:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D58A061BD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.226793.392057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJMp-0001fX-F0; Wed, 17 Nov 2021 11:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226793.392057; Wed, 17 Nov 2021 11:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJMp-0001fQ-C0; Wed, 17 Nov 2021 11:44:43 +0000
Received: by outflank-mailman (input) for mailman id 226793;
 Wed, 17 Nov 2021 11:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N6FX=QE=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mnJMn-0001fK-UY
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:44:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bf74587d-479b-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:44:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A3601FB;
 Wed, 17 Nov 2021 03:44:39 -0800 (PST)
Received: from [10.57.29.207] (unknown [10.57.29.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C3963F70D;
 Wed, 17 Nov 2021 03:44:31 -0800 (PST)
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
X-Inumbo-ID: bf74587d-479b-11ec-a9d2-d9f7a1cc8784
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Dario Faggioli
 <dfaggioli@suse.com>, David Scott <dave@recoil.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <7354e1bf-f34e-c604-b126-fdbfd53afe62@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <0e8ab234-edf4-10d4-74ea-ddb9d1e2953c@arm.com>
Date: Wed, 17 Nov 2021 12:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7354e1bf-f34e-c604-b126-fdbfd53afe62@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 17.11.2021 11:00, Julien Grall wrote:
> Hi,
> 
> On 17/11/2021 09:53, Roger Pau Monne wrote:
>> Document some of the relevant changes during the 4.16 release cycle,
>> likely more entries are missing.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>   CHANGELOG.md | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index ad1a8c2bc2..8b0bdd9cf0 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>>      no longer be built per default. In order to be able to use those, configure needs to
>>      be called with "--enable-qemu-traditional" as parameter.
>> + - Fixes for credit2 scheduler stability in corner case conditions.
>> + - Ongoing improvements in the hypervisor build system.
>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>> + - 32bit PV guests only supported in shim mode.
>> + - Improved PVH dom0 debug key handling.
>> + - Fix booting on some Intel systems without a PIT (i8254).
>> +
>> +### Added
>> + - 32bit Arm builds to the automated tests.
>> + - New x86 pagetable APIs.
>> + - Arm vPMU support.
> 
> I would add "Early" or something similar because this can only work in a constrained setup.
> 
+1.
I would say:
"Arm early vPMU support for guests."

> Cheers,
> 

Cheers,
Michal

