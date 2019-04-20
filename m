Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8D8C282E2
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:24:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDE42087F
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDE42087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHrrC-00049L-UZ; Sat, 20 Apr 2019 15:24:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFeN=SW=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1hHrrA-000495-O1
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 15:24:44 +0000
X-Inumbo-ID: 6bf64945-6380-11e9-92d7-bc764e045a96
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6bf64945-6380-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 15:24:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z6so10876058wmi.0
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aN8ovK6MLgPyDT9K6fPdxnO4TPJN6/GOvyeYdsc0Fpg=;
 b=n+eZRJEaqq49LnhqPkbv0ul1OPQgU7pnidiCyXtD8UKVn98BDGQQ42KmcphPKm88v0
 naTXEwAq0UACkRbHFIuqUQgrUotuhgS6MRTxP/PeVcilJg3DzCF9ScOhV2sqeXAtwqlX
 V8GoJCARmZ7d/ScnM5elFWRQo0MYzOqX6umZ+/aqzOM+F5Ty5n8UUdGjxIp4omRIi5wE
 WohGxqQdgyQ87HGg6k4BONpnBoCksbZw3goNrf9THaBr/MBfqY0rTAmvDXlp9vlx3bVP
 NEhEagaob6xkA2LumXSEXI/f99Fau72QAvIANqkHU+2DVjswVlF7s/Z5VL1SJ5iFjOoT
 drMA==
X-Gm-Message-State: APjAAAWx0ZX+3J2N4XqQXjz3bswAaNEE2rcis8KCg2w2L+dwg9Z2HEPc
 hUb1IAIhYbTnLxYo6zRSErMnWkqO3ao=
X-Google-Smtp-Source: APXvYqzpdll8nS2reTTJvTDKDq740iswK8KazTs0ntvlreoNntvgGZW93JelwHzh/TiOgGrSsBHc6w==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr6407423wmi.67.1555773882349;
 Sat, 20 Apr 2019 08:24:42 -0700 (PDT)
Received: from [127.0.0.1] (87.78.186.89.cust.ip.kpnqwest.it. [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id
 y3sm7093626wmi.27.2019.04.20.08.24.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 08:24:41 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 20 Apr 2019 17:24:40 +0200
Message-ID: <155577388014.25746.13361382203794112287.stgit@wayrath>
In-Reply-To: <155577364571.25746.11988517450711182732.stgit@wayrath>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen: credit2: avoid using cpumask_weight()
 in hot-paths
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420152440.E56d7rK75mHVdd5RiqyWeYt6cj9EFZKCGabVSn6_YaA@z>

Y3B1bWFza193ZWlnaHQoKSBpcyBrbm93biB0byBiZSBleHBlbnNpdmUuIEluIENyZWRpdDIsIHdl
IHVzZSBpdCBpbgpsb2FkLWJhbGFuY2luZywgYnV0IG9ubHkgZm9yIGtub3dpbmcgaG93IG1hbnkg
Q1BVcyBhcmUgYWN0aXZlIGluIGEKcnVucXVldWUuCgpLZWVwaW5nIHN1Y2ggY291bnQgaW4gYW4g
aW50ZWdlciBmaWVsZCBvZiB0aGUgcGVyLXJ1bnF1ZXVlIGRhdGEKc3RydWN0dXJlIHdlIGhhdmUs
IGNvbXBsZXRlbHkgYXZvaWRzIHRoZSBuZWVkIGZvciBjcHVtYXNrX3dlaWdodCgpLgoKV2hpbGUg
dGhlcmUsIHJlbW92ZSBhcyBtdWNoIG90aGVyIHVzZXMgb2YgaXQgYXMgd2UgY2FuLCBldmVuIGlm
IG5vdCBpbgpob3QtcGF0aHMuCgpTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0
cml4LmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyB8ICAgMjEgKysrKysrKysr
KysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyBiL3hlbi9jb21t
b24vc2NoZWRfY3JlZGl0Mi5jCmluZGV4IDY5NThiMjY1ZmMuLjcwMzQzMjUyNDMgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3Jl
ZGl0Mi5jCkBAIC00NjYsNiArNDY2LDcgQEAgc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0YSB7
CiAgICAgc3BpbmxvY2tfdCBsb2NrOyAgICAgICAgICAgLyogTG9jayBmb3IgdGhpcyBydW5xdWV1
ZSAgICAgICAgICAgICAgICAgICAgICovCiAKICAgICBzdHJ1Y3QgbGlzdF9oZWFkIHJ1bnE7ICAg
ICAvKiBPcmRlcmVkIGxpc3Qgb2YgcnVubmFibGUgdm1zICAgICAgICAgICAgICAgKi8KKyAgICBp
bnQgbnJfY3B1czsgICAgICAgICAgICAgICAvKiBIb3cgbWFueSBDUFVzIGFyZSBzaGFyaW5nIHRo
aXMgcnVucXVldWUgICAgKi8KICAgICBpbnQgaWQ7ICAgICAgICAgICAgICAgICAgICAvKiBJRCBv
ZiB0aGlzIHJ1bnF1ZXVlICgtMSBpZiBpbnZhbGlkKSAgICAgICAgKi8KIAogICAgIGludCBsb2Fk
OyAgICAgICAgICAgICAgICAgIC8qIEluc3RhbnRhbmVvdXMgbG9hZCAobnVtIG9mIG5vbi1pZGxl
IHZjcHVzKSAqLwpAQCAtMjYxMyw4ICsyNjE0LDggQEAgcmV0cnk6CiAgICAgICAgIGlmICggc3Qu
b3JxZC0+Yl9hdmdsb2FkID4gbG9hZF9tYXggKQogICAgICAgICAgICAgbG9hZF9tYXggPSBzdC5v
cnFkLT5iX2F2Z2xvYWQ7CiAKLSAgICAgICAgY3B1c19tYXggPSBjcHVtYXNrX3dlaWdodCgmc3Qu
bHJxZC0+YWN0aXZlKTsKLSAgICAgICAgaSA9IGNwdW1hc2tfd2VpZ2h0KCZzdC5vcnFkLT5hY3Rp
dmUpOworICAgICAgICBjcHVzX21heCA9IHN0LmxycWQtPm5yX2NwdXM7CisgICAgICAgIGkgPSBz
dC5vcnFkLT5ucl9jcHVzOwogICAgICAgICBpZiAoIGkgPiBjcHVzX21heCApCiAgICAgICAgICAg
ICBjcHVzX21heCA9IGk7CiAKQEAgLTM2OTcsNyArMzY5OCw3IEBAIGNzY2hlZDJfZHVtcChjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiAgICAgICAgICAgICAgICAiXHRpbnN0bG9hZCAgICAg
ICAgICAgPSAlZFxuIgogICAgICAgICAgICAgICAgIlx0YXZlbG9hZCAgICAgICAgICAgID0gJSJQ
Uklfc3RpbWUiICh+JSJQUklfc3RpbWUiJSUpXG4iLAogICAgICAgICAgICAgICAgaSwKLSAgICAg
ICAgICAgICAgIGNwdW1hc2tfd2VpZ2h0KCZwcnYtPnJxZFtpXS5hY3RpdmUpLAorICAgICAgICAg
ICAgICAgcHJ2LT5ycWRbaV0ubnJfY3B1cywKICAgICAgICAgICAgICAgIG5yX2NwdV9pZHMsIGNw
dW1hc2tfYml0cygmcHJ2LT5ycWRbaV0uYWN0aXZlKSwKICAgICAgICAgICAgICAgIHBydi0+cnFk
W2ldLm1heF93ZWlnaHQsCiAgICAgICAgICAgICAgICBwcnYtPnJxZFtpXS5waWNrX2JpYXMsCkBA
IC0zODE4LDYgKzM4MTksOSBAQCBpbml0X3BkYXRhKHN0cnVjdCBjc2NoZWQyX3ByaXZhdGUgKnBy
diwgc3RydWN0IGNzY2hlZDJfcGNwdSAqc3BjLAogICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwg
JnBydi0+aW5pdGlhbGl6ZWQpOwogICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwgJnJxZC0+c210
X2lkbGUpOwogCisgICAgcnFkLT5ucl9jcHVzKys7CisgICAgQVNTRVJUKGNwdW1hc2tfd2VpZ2h0
KCZycWQtPmFjdGl2ZSkgPT0gcnFkLT5ucl9jcHVzKTsKKwogICAgIC8qIE9uIHRoZSBib290IGNw
dSB3ZSBhcmUgY2FsbGVkIGJlZm9yZSBjcHVfc2libGluZ19tYXNrIGhhcyBiZWVuIHNldCB1cC4g
Ki8KICAgICBpZiAoIGNwdSA9PSAwICYmIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUg
KQogICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsICZjc2NoZWQyX3BjcHUoY3B1KS0+c2li
bGluZ19tYXNrKTsKQEAgLTM4MjksOCArMzgzMywxMSBAQCBpbml0X3BkYXRhKHN0cnVjdCBjc2No
ZWQyX3ByaXZhdGUgKnBydiwgc3RydWN0IGNzY2hlZDJfcGNwdSAqc3BjLAogICAgICAgICAgICAg
ICAgIF9fY3B1bWFza19zZXRfY3B1KHJjcHUsICZjc2NoZWQyX3BjcHUoY3B1KS0+c2libGluZ19t
YXNrKTsKICAgICAgICAgICAgIH0KIAotICAgIGlmICggY3B1bWFza193ZWlnaHQoJnJxZC0+YWN0
aXZlKSA9PSAxICkKKyAgICBpZiAoIHJxZC0+bnJfY3B1cyA9PSAxICkKKyAgICB7CisJQVNTRVJU
KGNwdW1hc2tfd2VpZ2h0KCZycWQtPmFjdGl2ZSkgPT0gMSk7CiAgICAgICAgIHJxZC0+cGlja19i
aWFzID0gY3B1OworICAgIH0KIAogICAgIHJldHVybiBzcGMtPnJ1bnFfaWQ7CiB9CkBAIC0zOTQ0
LDggKzM5NTEsMTIgQEAgY3NjaGVkMl9kZWluaXRfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqb3BzLCB2b2lkICpwY3B1LCBpbnQgY3B1KQogICAgIF9fY3B1bWFza19jbGVhcl9jcHUoY3B1
LCAmcnFkLT5zbXRfaWRsZSk7CiAgICAgX19jcHVtYXNrX2NsZWFyX2NwdShjcHUsICZycWQtPmFj
dGl2ZSk7CiAKLSAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJnJxZC0+YWN0aXZlKSApCisgICAgcnFk
LT5ucl9jcHVzLS07CisgICAgQVNTRVJUKGNwdW1hc2tfd2VpZ2h0KCZycWQtPmFjdGl2ZSkgPT0g
cnFkLT5ucl9jcHVzKTsKKworICAgIGlmICggcnFkLT5ucl9jcHVzID09IDAgKQogICAgIHsKKwlB
U1NFUlQoY3B1bWFza19lbXB0eSgmcnFkLT5hY3RpdmUpKTsKICAgICAgICAgcHJpbnRrKFhFTkxP
R19JTkZPICIgTm8gY3B1cyBsZWZ0IG9uIHJ1bnF1ZXVlLCBkaXNhYmxpbmdcbiIpOwogICAgICAg
ICBkZWFjdGl2YXRlX3J1bnF1ZXVlKHBydiwgc3BjLT5ydW5xX2lkKTsKICAgICB9CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
