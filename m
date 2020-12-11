Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B349C4167B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 13:57:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0193223ECD
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 13:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0193223ECD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50624.89325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniui-0005P8-Cb; Fri, 11 Dec 2020 13:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50624.89325; Fri, 11 Dec 2020 13:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniui-0005P1-8i; Fri, 11 Dec 2020 13:56:52 +0000
Received: by outflank-mailman (input) for mailman id 50624;
 Fri, 11 Dec 2020 13:56:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv6e=FP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kniug-0005Ow-V8
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 13:56:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b62ecfc1-3390-4ead-827b-32d980ad6ff0;
 Fri, 11 Dec 2020 13:56:49 +0000 (UTC)
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
X-Inumbo-ID: b62ecfc1-3390-4ead-827b-32d980ad6ff0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607695009;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Y9q/K51kNVP1X62NUU7bPzV0ysaWRI9CTxHOwDYR8cg=;
  b=ZQUc9v3ko9tDvDGkzK9cp994xESiwy+8bIvmg5Ph0uHygWBPwVxr84BP
   qDgHx2R1G2LP7jA2iYEhJmdpKZB7mCnp99IpurqNlZtEmS7F5Nyst49ai
   cWBmyt2k1pMDDuG+llAvfA9W8nfFkmxjrKu/rmtCwHZ02fKi07PFKj/Hu
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2AX/flIBpSAkFKmEn8A5EmZ9AIVTEcTNs7qkHBgYHDsWdg45+5R3AocvWAzhEaCGSKNuNP2gOG
 /a7gyjz0uzos6JvXet4SEk+piKEzpQn9S79yv32wf+Rjyw/AMdBK4Nfm35doFVerF6fapLop9R
 peLqKXVyfKdm9WUO04iTrqfkJLwl58aL6PFaaTnAFa9UfiEehaKrHZFYBFgLNdYd/oWvou60M3
 tKt5eTZX80rJ5+Y87E8vjLy6cwKFW+AbUexJzC0oP7RflPEQJLVkJ6qDPJyFjj83XtFzV7ma3r
 4Jk=
X-SBRS: 5.2
X-MesageID: 33051843
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,411,1599537600"; 
   d="scan'208";a="33051843"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <2c345ef9-1f05-f883-d294-7ac1b3851f08@suse.com>
 <20201211111546.GE1423@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cfb58d3a-e74e-77a5-9974-6782f5b500af@citrix.com>
Date: Fri, 11 Dec 2020 13:56:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211111546.GE1423@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 11/12/2020 11:15, Manuel Bouyer wrote:
> On Fri, Dec 11, 2020 at 09:58:54AM +0100, Jan Beulich wrote:
>> Could you please revert 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")?
>> I think there was a thinko there in that the change can't be split from
>> the bigger one which was part of the originally planned set for XSA-286.
>> We mustn't avoid the switching of page tables as long as
>> guest_get_eff{,_kern}_l1e() makes use of the linear page tables.
> Yes, reverting this commit also makes the dom0 boot.
>

This was going to be my next area of investigation.  Thanks for confirming.

In hindsight, the bug is very obvious...

~Andrew

