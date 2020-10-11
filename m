Return-Path: <SRS0=Fsqj=DS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80F2C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2020 11:21:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AB7207FB
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2020 11:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="F+j02LAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75AB7207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5658.14685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRZPF-0006zW-1D; Sun, 11 Oct 2020 11:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5658.14685; Sun, 11 Oct 2020 11:20:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRZPE-0006zP-Tp; Sun, 11 Oct 2020 11:20:48 +0000
Received: by outflank-mailman (input) for mailman id 5658;
 Sun, 11 Oct 2020 11:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kRZPE-0006zK-1C
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 11:20:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30d1cd9f-3591-4f34-829b-f44e2db5de21;
 Sun, 11 Oct 2020 11:20:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kRZPE-0006zK-1C
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 11:20:48 +0000
X-Inumbo-ID: 30d1cd9f-3591-4f34-829b-f44e2db5de21
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 30d1cd9f-3591-4f34-829b-f44e2db5de21;
	Sun, 11 Oct 2020 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602415246;
  h=subject:from:to:references:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=F96iuLJBrM3+ym/2qb2p66Ok0Td8MfgT4AUYKVDQMnY=;
  b=F+j02LAKc46ex+qrw0JBqcqKUfRPJPudjfaOWhjoDZET3/iV+XCe336z
   24TesPVgaOreavj9ZJOeY0ryUJ7C+I9cLIz/PYg/b7DLJSFZ7y5nHjUWW
   zuJEiHoCl38wsER74RTDPC1tiTiulQ2AonL/juGZmJRTUIly2GOOsfg2c
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bSo58SLb3wVD/sgPRXTPLVptudqNtD6RB6mA874kVyViib1g39LSL8y95XToWlxwRatKP6XCsO
 07EU6SLshljox5IlFClPvDBe+sm9wN3BYSViJ43sks6aijuDL2vuYz3CiaY1Ejm3+R3Df5B+0s
 s6QdI7btBwFyKbuBvprWZ16FI2/zCNCbMo0R4lIsIDAlodj2zWuprAJEBsz2Z86ITjUsBVNWL9
 kDZgdhuh3cQTzl0k0jIPhG6akr/MfQGIKd/MXSpDouzPaqC21cVuCA4ANc2KShmHM56ZZ1kK92
 jM4=
X-SBRS: 2.5
X-MesageID: 29077927
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,362,1596513600"; 
   d="scan'208";a="29077927"
Subject: Re: [SUSPECTED SPAM]Xen-unstable :can't boot HVM guests, bisected to
 commit: "hvmloader: indicate ACPI tables with "ACPI data" type in e820"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
References: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
 <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
 <24413d2e-5665-bc36-452b-af5c9b1af0b8@eikelenboom.it>
 <a7e46051-999d-fa5a-6707-d4c6e61727bb@citrix.com>
Message-ID: <03219f26-3a2c-edcd-6654-a084102f9020@citrix.com>
Date: Sun, 11 Oct 2020 12:20:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a7e46051-999d-fa5a-6707-d4c6e61727bb@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2020 11:40, Igor Druzhinin wrote:
> On 11/10/2020 10:43, Sander Eikelenboom wrote:
>> On 11/10/2020 02:06, Igor Druzhinin wrote:
>>> On 10/10/2020 18:51, Sander Eikelenboom wrote:
>>>> Hi Igor/Jan,
>>>>
>>>> I tried to update my AMD machine to current xen-unstable, but
>>>> unfortunately the HVM guests don't boot after that. The guest keeps
>>>> using CPU-cycles but I don't get to a command prompt (or any output at
>>>> all). PVH guests run fine.
>>>>
>>>> Bisection leads to commit:
>>>>
>>>> 8efa46516c5f4cf185c8df179812c185d3c27eb6
>>>> hvmloader: indicate ACPI tables with "ACPI data" type in e820
>>>>
>>>> I tried xen-unstable with this commit reverted and with that everything
>>>> works fine.
>>>>
>>>> I attached the xl-dmesg output.
>>>
>>> What guests are you using? 
>> Not sure I understand what you ask for, but:
>> dom0 PV
>> guest HVM (qemu-xen)
>>
>>> Could you get serial output from the guest?
>> Not getting any, it seems to be stuck in very early boot.
>>
>>> Is it AMD specific?
>> Can't tell, this is the only machine I test xen-unstable on.
>> It's a AMD phenom X6.
>> Both dom0 and guest kernel are 5.9-rc8.
>>
>> Tested with guest config:
>> kernel      = '/boot/vmlinuz-xen-guest'
>> ramdisk     = '/boot/initrd.img-xen-guest'
>>
>> cmdline     = 'root=UUID=7cc4a90d-d6b0-4958-bb7d-50497aa29f18 ro
>> nomodeset console=tty1 console=ttyS0 console=hvc0 earlyprintk=xen'
>>
>> type='hvm'
>>
>> device_model_version = 'qemu-xen'
>>
>> cpus        = "2-5"
>> vcpus = 2
>>
>> memory      = '512'
>>
>> disk        = [
>>                   'phy:/dev/xen_vms_ssd/media,xvda,w'
>>               ]
>>
>> name        = 'guest'
>>
>> vif         = [ 'bridge=xen_bridge,ip=192.168.1.10,mac=00:16:3E:DC:0A:F1' ]
>>
>> on_poweroff = 'destroy'
>> on_reboot   = 'restart'
>> on_crash    = 'preserve'
>>
>> vnc=0
>>
>>
>>> If it's a Linux guest could you get a stacktrace from
>>> the guest using xenctx?
>>
>> It is, here are few subsequent runs:
>>
>> ~# /usr/local/lib/xen/bin/xenctx -s
>> /boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
>> vcpu0:
>> cs:eip: ca80:00000256
> 
> Ok, it's stuck in linuxboot.bin option ROM. That's not something we test in Citrix -
> we don't use fw_cfg. It could be something with caching (given it's moving but slowly) or a
> bug uncovered by memory map changes. I'll try to get a repro on Monday.

Right, I think I know what will fix your problem - could you flip "ACPI data"
type to "ACPI NVS" in my commit.

Jan, this is what we've discussed on the list as an ambiguity in ACPI spec but
couldn't reach a clean resolution after all.
SeaBIOS thinks that "ACPI data" type is essentially RAM that could be reported
as RAM resource to the guest in E801.
https://wiki.osdev.org/Detecting_Memory_(x86)#BIOS_Function:_INT_0x15.2C_AX_.3D_0xE801

// Calculate the maximum ramsize (less than 4gig) from e820 map.
static void
calcRamSize(void)
{
    u32 rs = 0;
    int i;
    for (i=e820_count-1; i>=0; i--) {
        struct e820entry *en = &e820_list[i];
        u64 end = en->start + en->size;
        u32 type = en->type;
        if (end <= 0xffffffff && (type == E820_ACPI || type == E820_RAM)) {
            rs = end;
            break;
        }
    }
    LegacyRamSize = rs >= 1024*1024 ? rs : 1024*1024;
}

what is wrong here I think is that it clearly doesn't handle holes and worked more
by luck. So SeaBIOS needs to be fixed but I think that using ACPI NVS in hvmloader
is still safer.

Igor

