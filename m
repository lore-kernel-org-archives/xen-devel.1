Return-Path: <SRS0=r6zo=T4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC1AC04AB6
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 10:34:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6602075C
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 10:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6602075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQX-0005Zw-UG; Tue, 28 May 2019 10:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQB-0004mX-7a
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:31 +0000
X-Inumbo-ID: 05782256-8134-11e9-b161-478322974612
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05782256-8134-11e9-b161-478322974612;
 Tue, 28 May 2019 10:33:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6E29AFF9;
 Tue, 28 May 2019 10:33:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:38 +0200
Message-Id: <20190528103313.1343-26-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 25/60] xen: add sched_unit_pause_nosync() and
 sched_unit_unpause()
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190528103238.syU5G6kBaHW9bk-3jHTH5_IsF2LuuyDPgFSR77aA0Ac@z>

VGhlIGNyZWRpdCBzY2hlZHVsZXIgY2FsbHMgdmNwdV9wYXVzZV9ub3N5bmMoKSBhbmQgdmNwdV91
bnBhdXNlKCkKdG9kYXkuIEFkZCBzY2hlZF91bml0X3BhdXNlX25vc3luYygpIGFuZCBzY2hlZF91
bml0X3VucGF1c2UoKSB0bwpwZXJmb3JtIHRoZSBzYW1lIG9wZXJhdGlvbnMgb24gc2NoZWR1bGVy
IHVuaXRzIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgfCAgNiArKystLS0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMTAgKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
c2NoZWRfY3JlZGl0LmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCmluZGV4IDBiYzZhODdk
MzAuLjA1ZGY5ZTU0YWMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKKysr
IGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwpAQCAtMTA3MSw3ICsxMDcxLDcgQEAgY3NjaGVk
X3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQpCiAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoQ1NDSEVEX0ZMQUdfVU5JVF9Q
QVJLRUQsICZzdmMtPmZsYWdzKSApCiAgICAgewogICAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKHVu
aXRfdW5wYXJrKTsKLSAgICAgICAgdmNwdV91bnBhdXNlKHN2Yy0+dW5pdC0+dmNwdSk7CisgICAg
ICAgIHNjaGVkX3VuaXRfdW5wYXVzZShzdmMtPnVuaXQpOwogICAgIH0KIAogICAgIHNwaW5fbG9j
a19pcnEoJnBydi0+bG9jayk7CkBAIC0xNTIxLDcgKzE1MjEsNyBAQCBjc2NoZWRfYWNjdCh2b2lk
KiBkdW1teSkKICAgICAgICAgICAgICAgICAgICAgICF0ZXN0X2FuZF9zZXRfYml0KENTQ0hFRF9G
TEFHX1VOSVRfUEFSS0VELCAmc3ZjLT5mbGFncykgKQogICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyh1bml0X3BhcmspOwotICAgICAgICAgICAg
ICAgICAgICB2Y3B1X3BhdXNlX25vc3luYyhzdmMtPnVuaXQtPnZjcHUpOworICAgICAgICAgICAg
ICAgICAgICBzY2hlZF91bml0X3BhdXNlX25vc3luYyhzdmMtPnVuaXQpOwogICAgICAgICAgICAg
ICAgIH0KIAogICAgICAgICAgICAgICAgIC8qIExvd2VyIGJvdW5kIG9uIGNyZWRpdHMgKi8KQEAg
LTE1NDUsNyArMTU0NSw3IEBAIGNzY2hlZF9hY2N0KHZvaWQqIGR1bW15KQogICAgICAgICAgICAg
ICAgICAgICAgKiBpZiBpdCBpcyB3b2tlbiB1cCBoZXJlLgogICAgICAgICAgICAgICAgICAgICAg
Ki8KICAgICAgICAgICAgICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyh1bml0X3VucGFyayk7Ci0g
ICAgICAgICAgICAgICAgICAgIHZjcHVfdW5wYXVzZShzdmMtPnVuaXQtPnZjcHUpOworICAgICAg
ICAgICAgICAgICAgICBzY2hlZF91bml0X3VucGF1c2Uoc3ZjLT51bml0KTsKICAgICAgICAgICAg
ICAgICAgICAgY2xlYXJfYml0KENTQ0hFRF9GTEFHX1VOSVRfUEFSS0VELCAmc3ZjLT5mbGFncyk7
CiAgICAgICAgICAgICAgICAgfQogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQt
aWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IGM1YmMwYjY4OWMuLmNhNzBm
ZmI3ZTkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC00MjYsNiArNDI2LDE2IEBAIHN0YXRpYyBpbmxpbmUg
aW50IHNjaGVkX2FkanVzdF9jcHVwb29sKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMsCiAgICAg
cmV0dXJuIHMtPmFkanVzdF9nbG9iYWwgPyBzLT5hZGp1c3RfZ2xvYmFsKHMsIG9wKSA6IDA7CiB9
CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF91bml0X3BhdXNlX25vc3luYyhzdHJ1Y3Qgc2No
ZWRfdW5pdCAqdW5pdCkKK3sKKyAgICB2Y3B1X3BhdXNlX25vc3luYyh1bml0LT52Y3B1KTsKK30K
Kworc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX3VuaXRfdW5wYXVzZShzdHJ1Y3Qgc2NoZWRfdW5p
dCAqdW5pdCkKK3sKKyAgICB2Y3B1X3VucGF1c2UodW5pdC0+dmNwdSk7Cit9CisKICNkZWZpbmUg
UkVHSVNURVJfU0NIRURVTEVSKHgpIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICp4IyNf
ZW50cnkgXAogICBfX3VzZWRfc2VjdGlvbigiLmRhdGEuc2NoZWR1bGVycyIpID0gJng7CiAKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
