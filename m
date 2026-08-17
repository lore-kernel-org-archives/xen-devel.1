Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2E7C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:49:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392632.1631594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt21-00085F-F9; Mon, 17 Aug 2026 08:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392632.1631594; Mon, 17 Aug 2026 08:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt21-000858-C4; Mon, 17 Aug 2026 08:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1392632;
 Mon, 17 Aug 2026 08:49:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt1z-000852-GO
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt1y-00G8Es-Pp
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:49:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82caf6-e002-0a2a0a5209dd-0a2a4503b196-48
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:49:18 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cb0e-fae8-0a2a45030019-d155dd32c91e-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:49:18 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47fd4531020so1852085f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:49:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b572sm2159848f8f.13.2026.08.17.01.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:49:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786956558; x=1787561358; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Of7X9K1yGzrlBthhfqPFesBMb3c7qDgIQCv8Ns03xY=;
        b=BiUdOPYXg3vfOSh15PUCGZzKJk6wSZtKpoBgOYS7IF90slZZ2HvkT9keMglbz/jcY8
         wj7PSDOzjJ1jVeUevvZ0zMRjGTpdnAS0YA+NE4ZjvX9Obhg02dSbdnCLp2A0LNhgwa9w
         HabDFyW6afANpk0T/aMySei0dIcceWr0W4tTbLjE+cTuDuZ2cuaQMCthFCg/FvkwMeTr
         XVEoqiil03ZXHwe3qrBI/cpQDs1tPpAvGYdG88oqxrOafMBe4Zjpy+/eyK9UpCCShaG4
         UokY/KQS4TkLCo3jiC+VHTdmEsIQg7vkglivKtcocMC/SiGhRM1IlRW4iZp+ZuJpcqL/
         7Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956558; x=1787561358;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Of7X9K1yGzrlBthhfqPFesBMb3c7qDgIQCv8Ns03xY=;
        b=SggmhPgNWx7tJ5xWOyvwGFPMQ0qnuQCZPpVa2nVKm4mDNJWr/g/tSyuNNjm1oRWRbX
         RFyPkTUXm69cjVV9k5GeSorbQ1rDz8sd+iU4TfJdO1FCChyTJKJTSWp0Sxi8OHlqzh7e
         vzxZHxBMkpgLXxqFvt24Xg/vlR9660TkBQMTgXzvKojXQqGbC8N+YZsu0qXJuZrTyWb1
         6ntitmYFpSzdOiTBBUB+EXU+RnybdpIvv7b3q91lLP2xXsPJ/J1Yr5wXDrxz4dfXdMyB
         w4N2UObpLGKoKRc3KKJAMNQAcFCssCRKdQCAQ8ki7hoZV1Sr5t9rFVhBemswdTfJCpKb
         hU4A==
X-Gm-Message-State: AOJu0YzNhWTrS+RjwDG6jMJQjv+UBUie7pcfWf6AAwhMCw0/+7fhS0FT
	UQjolQpGCX7zXW/Jdt7BWoAiuhCnY5gemJaXprZpOj/5gGobcW505+kq921BUogdXstBFGQgRr8
	ex3yPeg==
X-Gm-Gg: AR+sD13Jyz5HUsYZXqERf0IdXa3Co3Rqluk85EFsd8JHqtYbalXVFAKFONipyoZjqwm
	OR3SoOfGJA7XUtsDQVhtgtarCS43P5ABgU0SeGS7VkChS0MOjX48T5lgMqUHrVTnshTYJtNW6Oh
	75mafATrHXVob6+tnt9YThUZ4Fqh0Hqm2F5S0bQD9lwlhzAl8cZV2K29UkjlpmuNKLqQPz2T1sR
	esmF7bXZfqrNw7wvLUVpGp5Z02G2ELOFFP6ePyImyhPFUz8hv3TZ9WNfCAvRQp3YFJKOIeHOhkp
	xF2xrBFIQA+b+GxMHy/ql7IYvcQEjqzoS/0Hzd9KqFnbmUWaKhcuCoAgOnRBEnkPCxgIdAr0H99
	TBNoT+7k3mtv5GbkSqnOqgKwx5PyROOE7GvwkdXMkZ1VDvzgUSBvBKO4QvWShxee+c/ncCthqrT
	JwZwy4NMpWwrdTFZUULPeaOYJAaFWW1TX71HDlN7EbZ69mp/MP/SG/rcdyfWFiQ0e0N4t1V9492
	leqpGonb82SoLWgAqWXBQibMDF6zLNXiavA073mq++YPoLLDBIm
X-Received: by 2002:a05:6000:430a:b0:474:530:9d with SMTP id ffacd0b85a97d-4816072d2d1mr35078741f8f.13.1786956558088;
        Mon, 17 Aug 2026 01:49:18 -0700 (PDT)
Message-ID: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
Date: Mon, 17 Aug 2026 10:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/14] XSM: follow-on to XSAs 492 and 499
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786956558-776F34E9-6EE5205F/0/0
X-purgate-type: clean
X-purgate-size: 1122

Working on those XSAs made pretty apparent that there's a lot of redundancy,
requiring changes in too many separate places if e.g. adding / altering /
removing a hook. Obviously while dealing with that, some other, smaller
tidying opportunities turned up as well, which is what is being dealt with
here.

v2 addresses review feedback and includes a few new patches. See individual
patches for details.

01: XSM: make xsm_default_action() const-correct
02: XSM: convert "allow" (Flask: "access") parameters to bool
03: x86/mm: get_page_from_l1e() is PV-or-shadow-only
04: x86: restrict PHYSDEVOP_* when PV=n
05: XSM: make Argo hooks well-formed ones
06: XSM: fold xsm_{,un}map_domain_pirq() hooks
07: x86: type-correct last parameter of map_domain_pirq()
08: XSM: pass just SBDF to xsm_{,un}map_domain_irq()
09: XSM: fold xsm_{,un}map_domain_irq() hooks
10: XSM: fold xsm_{,un}bind_pt_irq() hooks
11: XSM: convert remaining event channel hooks
12: XSM: convert remaining domain-related hooks
13: XSM: convert remaining miscellaneous hooks
14: XSM: avoid fragile assumptions in xsm_fixup_ops()

Jan

