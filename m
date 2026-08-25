Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF38C61DBE
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:28:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399268.1635421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys8b-0002uj-3R; Tue, 25 Aug 2026 14:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399268.1635421; Tue, 25 Aug 2026 14:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys8b-0002uc-0O; Tue, 25 Aug 2026 14:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1399268;
 Tue, 25 Aug 2026 14:28:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wys8Z-0002uW-Kp
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:28:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wys8Z-00AFOK-1Z
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:28:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da689-bab6-0a2a0a5309dd-0a2a45018ca8-8
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:28:27 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da68a-5984-0a2a45010019-d155d033a44d-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:28:26 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6a3819e8be8so1938409a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 07:28:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8b6412sm14817a12.2.2026.08.25.07.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 07:27:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787668106; x=1788272906; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nqPzEpldMcM/b3Zq3teNAXBIm5xTZsMOW+hKxk/P+ws=;
        b=DP+5OWDKgTEKiROOcPNeCXG/OUFGf1/Kq+7CeeEfrlCWXs6Hb7WwL2Dw3X8K/MyBaZ
         a2uNFJs5EQlUuQNUXJnzmj0mLQBho8I8V7c0I92zAUq/vRQOnr33hJgmvoXzDuH3XWqm
         O2jUM4bjkbFVkn71bG5XibgMswQIueG/TD/Bg8IFTRVa2L6BXj25+6Vxatf/uKDU3ell
         ODJcKYBjbAyUlIPwp28xwYPRDN9lg/6BW1YgLoEKciw21v58yMgqWoXTuXiuoB7SVPvM
         T6akrSkzji8nhaxHYOQMxMNPh8KVwwpO/7+FGiAnYwFx0ZGg539HB4GHsNhQLC7P8hEr
         CysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668106; x=1788272906;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nqPzEpldMcM/b3Zq3teNAXBIm5xTZsMOW+hKxk/P+ws=;
        b=moJCxsFsjyMqcNNd47JISn7/BWiIVcKFxjG5cz0FWmMeqxRIX6YymGtgQRXFYL4zUq
         RCNNZQz7TwqJ0qGhVO8Ge2U/73l9v280z0CzbQ1dnKa5Rv/grFTQjU+YTjxH2uTl+oSh
         Law9HP+SsR+iglTb1QyDQtAR5qQjUKFtBCLJDJlJxEs7I42gEQ3PqFdm1qp+7yzpUi1e
         q68xu25YCSaFZXo04G4pw82DxDTTmm5dLGddhLhv+4Nyb5T/K0L2+qh2yhm6ZIfBMeHk
         x4ZKKGdfHVFxpFwRrysYaMwvZtjU52h15+C43KF+JwGg40JGTRQlD8+vW4MOZEKlAgxI
         iosA==
X-Gm-Message-State: AFuF++mTln5ywO4eucllhFsbORHPfPRUKKun9bIFmmtB/FAt0b6NIINt
	exgSVHMkRDVh7eJExnK/TDdYq9KTt5ajaDBGPRHveYLeT/tPjQ+PoH9YBGy60ojJKNg+ppyM1zh
	+x9rGhg==
X-Gm-Gg: AR+sD10Tpib6O8CCYB/QHu2ZjbqofL184JpNSApWq1yfUgtiprJUBNXefI0J4E/aOJ9
	wfO0a+obb1cu8DBX5GBEtevoy3Rl6y81ipgZ9JiUIAd9QFDxTg4uM019ecf9A1l3RCFB3RP5l4l
	xnxZlaqR9vZ47VOLGl3JL+XxZKNq2uSGCVUfXav8uwGBSQ51tAY+J+xBJLQx2+V1zmI6yHH93o6
	LQJ1g12GxOG7GM06EFKjlR9oRpcg4cJZ7vbyJoGZDqD/4NfA7aBJLgHti6A+o+9+lk5YhKfaBpP
	Ish2/D3DtzRfl5MWB4E1wiFxPzcjr1AB6C9EjB0PZo3neyGzQNiMOotc6ZZuB71+ZVclgBkTtMu
	J/MrMDIF6e0I62Pzp15UjJfHDBoyPrUG2704PcWJ1XfGYIKUfY7nzZRv7OHbwVNr2EqRxcQF78z
	V+baPdqOZZ7q+vzruDlO0RLMCB4GG6mwf2gLGOO+kU9bdpPhCMvQ9+6N4Z6iWZQF0JL11NI8PJm
	aa4duknkSmm2c29DCjdKETzGtvskdYnYPUzL5wTQkTv+JPOCB8X
X-Received: by 2002:a05:6402:504c:b0:6a5:d8f0:dc0d with SMTP id 4fb4d7f45d1cf-6a5d8f0dd7dmr2529001a12.8.1787668106595;
        Tue, 25 Aug 2026 07:28:26 -0700 (PDT)
Message-ID: <69cbb2b8-8fed-4aa0-b1c6-0cbe135cb062@suse.com>
Date: Tue, 25 Aug 2026 16:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] symbols: drop _{s,e}extratext
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
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
In-Reply-To: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787668107-1E465757-FE55F059/0/0
X-purgate-type: clean
X-purgate-size: 2250

We're only about 18.5 years late with this: See Linux commit a3b81113fb66
("remove support for un-needed _extratext section"), i.e. from the 2.6.25
dev cycle.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -52,7 +52,7 @@ struct sym_entry {
 
 static struct sym_entry *table;
 static unsigned int table_size, table_cnt;
-static unsigned long long _stext, _etext, _sinittext, _einittext, _sextratext, _eextratext;
+static unsigned long long _stext, _etext, _sinittext, _einittext;
 static int all_symbols = 0;
 static int sort_by_name = 0;
 static int map_only = 0;
@@ -148,10 +148,6 @@ static int read_symbol(FILE *in, struct
 		_sinittext = s->addr;
 	else if (strcmp(sym, "_einittext") == 0)
 		_einittext = s->addr;
-	else if (strcmp(sym, "_sextratext") == 0)
-		_sextratext = s->addr;
-	else if (strcmp(sym, "_eextratext") == 0)
-		_eextratext = s->addr;
 	else if (toupper((uint8_t)stype) == 'A')
 	{
 		/* Keep these useful absolute symbols */
@@ -210,18 +206,16 @@ static int symbol_valid(struct sym_entry
 	 * and inittext sections are discarded */
 	if (!all_symbols) {
 		if ((s->addr < _stext || s->addr > _etext)
-		    && (s->addr < _sinittext || s->addr > _einittext)
-		    && (s->addr < _sextratext || s->addr > _eextratext))
+		    && (s->addr < _sinittext || s->addr > _einittext))
 			return 0;
 		/* Corner case.  Discard any symbols with the same value as
-		 * _etext _einittext or _eextratext; they can move between pass
-		 * 1 and 2 when the symbols data are added.  If these symbols
-		 * move then they may get dropped in pass 2, which breaks the
+		 * _etext or _einittext; they can move between pass 1 and 2
+		 * when the symbols data are added.  If these symbols move
+		 * then they may get dropped in pass 2, which breaks the
 		 * symbols rules.
 		 */
 		if ((s->addr == _etext && strcmp((char*)s->sym + offset, "_etext")) ||
-		    (s->addr == _einittext && strcmp((char*)s->sym + offset, "_einittext")) ||
-		    (s->addr == _eextratext && strcmp((char*)s->sym + offset, "_eextratext")))
+		    (s->addr == _einittext && strcmp((char*)s->sym + offset, "_einittext")))
 			return 0;
 	}
 


