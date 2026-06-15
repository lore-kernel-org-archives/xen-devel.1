Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAFFCD98C5
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 14:15:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338292.1599308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ85s-00033p-IB; Mon, 15 Jun 2026 14:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338292.1599308; Mon, 15 Jun 2026 14:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ85s-00033h-En; Mon, 15 Jun 2026 14:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1338292;
 Mon, 15 Jun 2026 14:15:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ85r-00033Q-2y
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:15:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ85q-00CXS4-Fr
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:15:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3008e7-2eae-0a2a0a5409dd-0a2a4504c4ec-38
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:15:14 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3008f2-1dec-0a2a45040019-d1558034e98b-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:15:14 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so15384345e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:15:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49220304180sm252635745e9.4.2026.06.15.07.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:15:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781532914; x=1782137714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bSU5BZAbb+7t8p1HVe3R8WCce3JTJoMBKaFkaOagLjk=;
        b=JnY8f0lC2WWkF+sdfo2yRMwBZPERnouwUyt7jrCmY0mWRtxxiBk1CdAYyKxgJUJyU6
         /smZyhcCGxr5M2KCEmX/Ky9JPngqzcmDdBVkSavFdF+iC1L1dKGhTlzg3U7lTSE+kn+4
         a2l96FFb/EmNtkDiEZmLb+kMajNQeeYHN33aiNUdULOONY5AaxpScuEZ9cKvPbXZgKw/
         9gVc2HoQnY9OrWmwUApLdQTUBtoZoPtJGSNxK5pguNc6u1ZAD34BRb/r5zM/YlpzwsmN
         pWW6Andw5viRB3i0Jtyw5VIMu7f7L+nmH9KYKf/Rjtgtwo3tAj9wac4aBeCh3xmL0Yjv
         nc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532914; x=1782137714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSU5BZAbb+7t8p1HVe3R8WCce3JTJoMBKaFkaOagLjk=;
        b=s6dNNr0Vmx9Vlr3rkveDAFE6ZtQhh77a8/7L3r7phGlJBybOlIyfb7jG1+5iyb2E/s
         MZoMFgbTDtQlwWPJRJcc/ReXPjxyinD2fEPI8STK/b8M0cm9p77iP4bnU9628KVJnW9M
         gVmR/NXRvXJd730voywa2g8bpvUWRlkwqwuUo+j2DSbt5rJQZxgcDDg7afaEUjR57ZYV
         qxukJo+aRxVoJN8a9lg2q02pgmNgsShjdrvsVgjiWLCsNhi4w5eiydDvj4FsznxDhjis
         Mj43m8i0WU82MXnZSbWBugHvkmTwZJY48DNbplwc+rZePrj5fam8OjdcINOGtUd6LDtb
         uePg==
X-Gm-Message-State: AOJu0YwHZiRbZ50a/0n7SAYGnj1+BUoTkuzL3FCqUhqlrX4bvMGMFHNv
	FBO3JV7/pKsJ7LthHnxWsYK/EKDb561ZPeQx3bdlddjQu3/8subcqcNIUbnl9Q/vpwXSjfjfgKX
	y+Qs=
X-Gm-Gg: Acq92OFES1Jfa4yUwIL8KK5tIE/wG3epTBAskrQ6WJLraxEAVmH0/Dq62cimpEqeoNd
	sZqmF2i0NlUhT6ztr4ya94dvwNxDx3cJUOVtMcNm8PvtpH738Ao5HrrcjvRWDXsHWPpUq242oqq
	VBKRHuJZ+gFfcRr6dA0IFHaUXq7rCdhZbwS154Z63tcjzXbBeRdkPXqLwY7BsN0Oqk6C3tce69e
	lBeSTFMuIXAkZMvLMDJnbWo0ySfBg8S9iKolsTlMcS9x3/npPp0yLDqyZvNpkTYputip3HWoYpA
	9fFCWeSt/lvijH+b1NamyH/AUroLsUmOuIiBtjg0i4ELrlayEkLGbNY4p73jFGQeFTn/LdxjpK+
	R2qUhRuzWr/86vy9Q0HX0yrPmBa83O6zDtA6Xt4ult2OL2oR283pa4fCTspOFqIHGJdwbC3Y8u0
	X22BVrDr4yvkwim/5p3SSf70ixXQebviBpVJ/tLthz9HVAEVPc2M7m/g9mQh138ajpa06w8kDs+
	MuKakEYnSu+xbk=
X-Received: by 2002:a05:600c:46c4:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490ec4fb506mr190915005e9.19.1781532912851;
        Mon, 15 Jun 2026 07:15:12 -0700 (PDT)
Message-ID: <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
Date: Mon, 15 Jun 2026 16:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 6/9] domctl: handle XEN_DOMCTL_getvcpuinfo without
 acquiring domctl lock
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781532914-4396A3FF-8B3DD307/0/0
X-purgate-type: clean
X-purgate-size: 2222

Like for XEN_DOMCTL_getdomaininfo there's no need to hold the domctl
lock for XEN_DOMCTL_getvcpuinfo. While moving the code also switch to
using domain_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tentatively-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -546,6 +546,33 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     if ( ret )
         goto domctl_out_unlock_rcuonly;
 
+    switch ( op->cmd )
+    {
+    case XEN_DOMCTL_getvcpuinfo:
+    {
+        const struct vcpu *v;
+
+        if ( (v = domain_vcpu(d, op->u.getvcpuinfo.vcpu)) == NULL )
+        {
+            ret = -ENOENT;
+            goto domctl_out_unlock_rcuonly;
+        }
+
+        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
+        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
+        op->u.getvcpuinfo.running  = v->is_running;
+        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
+        op->u.getvcpuinfo.cpu      = v->processor;
+
+        copyback = true;
+        goto domctl_out_unlock_rcuonly;
+    }
+
+    default:
+        /* Everything else handled further up or further down. */
+        break;
+    }
+
     if ( !domctl_lock_acquire() )
     {
         if ( d && d != dom_io )
@@ -792,28 +819,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         break;
     }
 
-    case XEN_DOMCTL_getvcpuinfo:
-    {
-        const struct vcpu *v;
-
-        ret = -EINVAL;
-        if ( op->u.getvcpuinfo.vcpu >= d->max_vcpus )
-            break;
-
-        ret = -ESRCH;
-        if ( (v = d->vcpu[op->u.getvcpuinfo.vcpu]) == NULL )
-            break;
-
-        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
-        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
-        op->u.getvcpuinfo.running  = v->is_running;
-        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
-        op->u.getvcpuinfo.cpu      = v->processor;
-        ret = 0;
-        copyback = 1;
-        break;
-    }
-
     case XEN_DOMCTL_max_mem:
     {
         uint64_t new_max = op->u.max_mem.max_memkb >> (PAGE_SHIFT - 10);


