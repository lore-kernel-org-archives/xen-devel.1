Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9C0C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:09:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749C3206C0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749C3206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDocj-0005zO-HD; Tue, 09 Apr 2019 11:09:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDoci-0005yb-8b
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:09:04 +0000
X-Inumbo-ID: e23a2cc8-5ab7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e23a2cc8-5ab7-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:09:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83095181"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:22 +0100
Message-ID: <20190409110844.14746-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 09/31] OvmfPkg/XenOvmf: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110822.vJkO5rRSXw2-u9yNU4qyof02LoB6vZcz3OzWabdMwBM@z>

QUNQSSBUaW1lciBkb2VzIG5vdCB3b3JrIGluIGEgUFZIIGd1ZXN0LCBidXQgbG9jYWwgQVBJQyB3
b3JrcyBvbiBib3RoClBWSCBhbmQgSFZNLgoKQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBD
b250cmlidXRpb24gQWdyZWVtZW50IDEuMQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBPdm1mUGtnL1hlbk92bWYuZHNjIHwgMTIg
KysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuT3ZtZi5kc2MgYi9Pdm1mUGtnL1hlbk92bWYu
ZHNjCmluZGV4IDdiOGExZmRmNmIuLmNjNTFiYWMzYmUgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVu
T3ZtZi5kc2MKKysrIGIvT3ZtZlBrZy9YZW5Pdm1mLmRzYwpAQCAtMTA0LDcgKzEwNCw3IEBAIFtT
a3VJZHNdCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogW0xpYnJhcnlDbGFzc2VzXQogICBQY2RM
aWJ8TWRlUGtnL0xpYnJhcnkvQmFzZVBjZExpYk51bGwvQmFzZVBjZExpYk51bGwuaW5mCi0gIFRp
bWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvQmFzZUFjcGlUaW1lckxpYi5pbmYK
KyAgVGltZXJMaWJ8TWRlUGtnL0xpYnJhcnkvU2VjUGVpRHhlVGltZXJMaWJDcHUvU2VjUGVpRHhl
VGltZXJMaWJDcHUuaW5mCiAgIFByaW50TGlifE1kZVBrZy9MaWJyYXJ5L0Jhc2VQcmludExpYi9C
YXNlUHJpbnRMaWIuaW5mCiAgIEJhc2VNZW1vcnlMaWJ8TWRlUGtnL0xpYnJhcnkvQmFzZU1lbW9y
eUxpYlJlcFN0ci9CYXNlTWVtb3J5TGliUmVwU3RyLmluZgogICBCYXNlTGlifE1kZVBrZy9MaWJy
YXJ5L0Jhc2VMaWIvQmFzZUxpYi5pbmYKQEAgLTIwNSw3ICsyMDUsNyBAQCBbTGlicmFyeUNsYXNz
ZXMuY29tbW9uXQogICBCYXNlQ3J5cHRMaWJ8Q3J5cHRvUGtnL0xpYnJhcnkvQmFzZUNyeXB0TGli
L0Jhc2VDcnlwdExpYi5pbmYKIAogW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5TRUNdCi0gIFRpbWVy
TGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvQmFzZVJvbUFjcGlUaW1lckxpYi5pbmYK
KyAgVGltZXJMaWJ8TWRlUGtnL0xpYnJhcnkvU2VjUGVpRHhlVGltZXJMaWJDcHUvU2VjUGVpRHhl
VGltZXJMaWJDcHUuaW5mCiAgIFFlbXVGd0NmZ0xpYnxPdm1mUGtnL0xpYnJhcnkvUWVtdUZ3Q2Zn
TGliL1FlbXVGd0NmZ1NlY0xpYi5pbmYKICFpZmRlZiAkKERFQlVHX09OX1NFUklBTF9QT1JUKQog
ICBEZWJ1Z0xpYnxNZGVQa2cvTGlicmFyeS9CYXNlRGVidWdMaWJTZXJpYWxQb3J0L0Jhc2VEZWJ1
Z0xpYlNlcmlhbFBvcnQuaW5mCkBAIC0yODQsNyArMjg0LDcgQEAgW0xpYnJhcnlDbGFzc2VzLmNv
bW1vbi5EWEVfQ09SRV0KIAogW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfUlVOVElNRV9EUklW
RVJdCiAgIFBjZExpYnxNZGVQa2cvTGlicmFyeS9EeGVQY2RMaWIvRHhlUGNkTGliLmluZgotICBU
aW1lckxpYnxPdm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0R4ZUFjcGlUaW1lckxpYi5pbmYK
KyAgVGltZXJMaWJ8TWRlUGtnL0xpYnJhcnkvU2VjUGVpRHhlVGltZXJMaWJDcHUvU2VjUGVpRHhl
VGltZXJMaWJDcHUuaW5mCiAgIEhvYkxpYnxNZGVQa2cvTGlicmFyeS9EeGVIb2JMaWIvRHhlSG9i
TGliLmluZgogICBEeGVDb3JlRW50cnlQb2ludHxNZGVQa2cvTGlicmFyeS9EeGVDb3JlRW50cnlQ
b2ludC9EeGVDb3JlRW50cnlQb2ludC5pbmYKICAgTWVtb3J5QWxsb2NhdGlvbkxpYnxNZGVQa2cv
TGlicmFyeS9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi5p
bmYKQEAgLTMwMSw3ICszMDEsNyBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9SVU5USU1F
X0RSSVZFUl0KIAogW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5VRUZJX0RSSVZFUl0KICAgUGNkTGli
fE1kZVBrZy9MaWJyYXJ5L0R4ZVBjZExpYi9EeGVQY2RMaWIuaW5mCi0gIFRpbWVyTGlifE92bWZQ
a2cvTGlicmFyeS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZgorICBUaW1lckxpYnxN
ZGVQa2cvTGlicmFyeS9TZWNQZWlEeGVUaW1lckxpYkNwdS9TZWNQZWlEeGVUaW1lckxpYkNwdS5p
bmYKICAgSG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxpYi9EeGVIb2JMaWIuaW5mCiAgIER4
ZUNvcmVFbnRyeVBvaW50fE1kZVBrZy9MaWJyYXJ5L0R4ZUNvcmVFbnRyeVBvaW50L0R4ZUNvcmVF
bnRyeVBvaW50LmluZgogICBNZW1vcnlBbGxvY2F0aW9uTGlifE1kZVBrZy9MaWJyYXJ5L1VlZmlN
ZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliLmluZgpAQCAtMzE2LDcg
KzMxNiw3IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uVUVGSV9EUklWRVJdCiAKIFtMaWJyYXJ5
Q2xhc3Nlcy5jb21tb24uRFhFX0RSSVZFUl0KICAgUGNkTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZVBj
ZExpYi9EeGVQY2RMaWIuaW5mCi0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJM
aWIvRHhlQWNwaVRpbWVyTGliLmluZgorICBUaW1lckxpYnxNZGVQa2cvTGlicmFyeS9TZWNQZWlE
eGVUaW1lckxpYkNwdS9TZWNQZWlEeGVUaW1lckxpYkNwdS5pbmYKICAgSG9iTGlifE1kZVBrZy9M
aWJyYXJ5L0R4ZUhvYkxpYi9EeGVIb2JMaWIuaW5mCiAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8TWRl
UGtnL0xpYnJhcnkvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRpb25M
aWIuaW5mCiAgIFJlcG9ydFN0YXR1c0NvZGVMaWJ8TWRlTW9kdWxlUGtnL0xpYnJhcnkvRHhlUmVw
b3J0U3RhdHVzQ29kZUxpYi9EeGVSZXBvcnRTdGF0dXNDb2RlTGliLmluZgpAQCAtMzQ0LDcgKzM0
NCw3IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uRFhFX0RSSVZFUl0KIAogW0xpYnJhcnlDbGFz
c2VzLmNvbW1vbi5VRUZJX0FQUExJQ0FUSU9OXQogICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhl
UGNkTGliL0R4ZVBjZExpYi5pbmYKLSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5L0FjcGlUaW1l
ckxpYi9EeGVBY3BpVGltZXJMaWIuaW5mCisgIFRpbWVyTGlifE1kZVBrZy9MaWJyYXJ5L1NlY1Bl
aUR4ZVRpbWVyTGliQ3B1L1NlY1BlaUR4ZVRpbWVyTGliQ3B1LmluZgogICBIb2JMaWJ8TWRlUGtn
L0xpYnJhcnkvRHhlSG9iTGliL0R4ZUhvYkxpYi5pbmYKICAgTWVtb3J5QWxsb2NhdGlvbkxpYnxN
ZGVQa2cvTGlicmFyeS9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi9VZWZpTWVtb3J5QWxsb2NhdGlv
bkxpYi5pbmYKICAgUmVwb3J0U3RhdHVzQ29kZUxpYnxNZGVNb2R1bGVQa2cvTGlicmFyeS9EeGVS
ZXBvcnRTdGF0dXNDb2RlTGliL0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIuaW5mCi0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
