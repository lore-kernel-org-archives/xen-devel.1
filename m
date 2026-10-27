Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD716606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LQ6E8snB
Received: from list by lists.xenproject.org with outflank-mailman.1461847.1672850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbGs-0006T2-Ad; Tue, 27 Oct 2026 07:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461847.1672850; Tue, 27 Oct 2026 07:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbGs-0006Sv-7h; Tue, 27 Oct 2026 07:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1461847;
 Tue, 27 Oct 2026 07:06:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLbGq-0006Sp-LM
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:06:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbGp-002xYi-NX
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:06:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae04d8c-8faa-0a2a0a5109dd-0a2a450cda1a-18
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:06:55 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae04d8f-f479-0a2a450c0019-d1558036d88a-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:06:55 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so30660725e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:06:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3cfasm21004237f8f.17.2026.10.27.00.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 00:06:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793084815; x=1793689615; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UBRrLU2xKYMZIrbRSHA32mAmR8fDYQPg/bOWs1ci48w=;
        b=LQ6E8snBx6Z/YGh5TlAeEPrWrrWHJS1mHu99l9IuxDJ1c6I+dqjyrfUdclM8JoifHk
         XHXDS32XCxVFwXz+z8RwXFsXSsc0skZXLMPtsvI7mwbCE174/G2bwKqi6AzQCx1SKpDE
         QSZQ9dewQHXKkYyMFTP/wUsOhF3Jt5wJCAVAccI6YucVbYJ26ayhydii3xUP8t/Dq413
         nqx4ih5yZNsuQ4LdQyaBPPueQAg3qKNhNYGhMtxn/lGq19+87gFslztEB9CXn1CSkhps
         7t0XZaZaoVCwm61YPh5jOaRLr4yBqn4TO5jbKQ3rbCOMmHY8GVm2adaE+oHHFVYgG0T/
         Pp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084815; x=1793689615;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBRrLU2xKYMZIrbRSHA32mAmR8fDYQPg/bOWs1ci48w=;
        b=pBxXHph+tEKsVDx9qfBziijJ28AlOLe+wrLct1EIYNlSfzxRs4pE4RLzUdT5xo6lb3
         H+iizAgtiCaSWrv04RxTjvu05EPBMqYl1idTYB3E6oDi3i3tPWVdOiYiaQtDNjxehRvm
         bu9UHDiEUZj54RIObOscHtAr5qOLjs4P34SUodDJSd9ceoMabSW0PLQdUeLD69FavKSs
         WmM7zLcLpiWPK4bW71lne/IA1oOion/Pnz0Xv1Iwg4PzhFy3q4ZMihCVHJku36NuIyV7
         ubn/pIG/yC+Y/mUeRWIZM5M4NZMDpC0U4VFAgZbwT0yufaqXsiansM3GOf0ES/0DYMZ9
         n7ug==
X-Gm-Message-State: AFq9FYJrPwWhJQ+T/ANIs/WK9NnHX2+xY0Y4VINeJ0/RMHajJsaGnLwg
	TMx1IJek4XIB/QAOcr5AwKDjvV4E3yl7+GJgPLf1CDSM9swUfbkH7UVCmH6YpXZjer+CNeQ+G/V
	ZC0pvUA==
X-Gm-Gg: AYBFou12xD5qP3/PXKsE60b0FVdyOeNUskXhuR48eYAuWoIyVGloqEGSyiZVZSB+n7Z
	P5XMphRqw2woyvTTuKX1gH0PogyQvrf9lQ3sCbYXlFaH31pjOENoHQEgDKuHchLcWC62ae7LeWc
	L7/5+FSmcMdCXyQW3vEDAFyzkgUuzbo9kwxkdV40Vv8eiqJ9L0GCi/b1edJbRV7raTSw4dQ99vQ
	jQqzfmAaCtWZLawXG0LJLTrGPf5lYgXmfvExMPLvAPHLdzqNCc4/Qc7y3vObBHrLVBgGVl0+kxc
	m7yv1F6H3hjnFCnfimqPEOd6vyXdLq6osWGBsU3b7t/PnnFRLExbvBNVU4Au2NeyYNxA8OARapH
	IZ4OxKvCqH1jN6ewQAVP7q5cTqi55YgRyxsnZS852YIENiG3jw7Ahb/BL1fQ8dwVp96ElaYG2wv
	NHkWizdxQEATMrFUNImIOGjymzzpgMOdWt3jVSNsZ9e3UFolEccOwS7zDCgu9+A8lify8dh5aD5
	ANUAvMDIfioPXIzT8p617QianC1J+yTdY0Eg1GYRsGr9f+9nVLim6qWUY8Jr79Hkrb4AAcdWaHN
	fwyk6hTe9es3rTmL2wXYNSGnYcetFJIW/XZrj1Fs5jVzsEVPlwo71hBJ/WN+IvemQQ==
X-Received: by 2002:a05:600d:14:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4a46fdbcc53mr113293195e9.11.1793084814989;
        Tue, 27 Oct 2026 00:06:54 -0700 (PDT)
Message-ID: <3dd54a18-a731-4c08-b848-8de6d620e406@suse.com>
Date: Tue, 27 Oct 2026 08:06:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Yehyeong Lee <yhlee@isslab.korea.ac.kr>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: special-case IOMMU (un)mapping failure path in
 _get_page_type()
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793084815-02ADCA5B-4D12D225/10/78276251493
X-purgate-type: spam
X-purgate-size: 2727
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The error path put in place to address XSA-291 was broken by the re-work
done for XSA-299: With PTF_partial_set not passed in (since PGT_partial is
clear for a page undergoing a type change) and the page not having
PGT_validated set just yet, _put_page_type() would fail its consistency
check for non-dying domains. Introduce yet another flag to indicate use of
the function from _get_page_type()'s recovery path.

Fixes: c40b33d72630 ("x86/mm: Don't drop a type ref unless you held a ref to begin with")
Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger@xenproject.org>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1088,6 +1088,7 @@ get_page_from_l1e(
  * more information.
  */
 #define PTF_partial_set           (1 << 0)
+#define PTF_recovery              (1 << 1)
 #define PTF_preemptible           (1 << 2)
 #define PTF_defer                 (1 << 3)
 #define PTF_retain_ref_on_restart (1 << 4)
@@ -2812,15 +2813,21 @@ static int _put_page_type(struct page_in
          * *not* fully validated, continuing would almost certainly
          * open up a security hole.  An exception to this is during
          * domain destruction, where PGT_validated can be dropped
-         * without dropping a type ref.
+         * without dropping a type ref.  Another exception is on error
+         * paths from _get_page_type(), where the type ref was already
+         * put in place, but PGT_validated isn't set yet (page
+         * validation still pending).
          *
-         * If the latter, do nothing unless type PGT_partial is set.
-         * If it is set, the type count must be 1.
+         * In the domain destruction case, do nothing unless PGT_partial
+         * is set.  If it is set, the type count must be 1.
+         *
+         * In the _get_page_type() error path case operate normally,
+         * again also including the type count sanity check.
          */
-        if ( !(flags & PTF_partial_set) )
+        if ( !(flags & (PTF_partial_set | PTF_recovery)) )
             BUG_ON((x & PGT_partial) ||
                    !((x & PGT_validated) || page_get_owner(page)->is_dying));
-        else if ( !(x & PGT_partial) )
+        else if ( (flags & PTF_partial_set) && !(x & PGT_partial) )
             return 0;
         else
             BUG_ON((x & PGT_count_mask) != 1);
@@ -3097,7 +3104,7 @@ static int _get_page_type(struct page_in
 
             if ( unlikely(rc) )
             {
-                _put_page_type(page, 0, NULL);
+                _put_page_type(page, PTF_recovery, NULL);
                 goto out;
             }
         }

