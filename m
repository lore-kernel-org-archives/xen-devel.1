From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/4] backports snapshot: Honour
 DebianSnapshotBackports_<suite> config var
Date: Wed, 13 Feb 2019 18:30:15 +0000
Message-ID: <20190213183018.5198-2-ian.jackson@eu.citrix.com>
References: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HrVK=QU=citrix.com=prvs=9402dae0b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gtzIq-0007go-BY
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 18:30:36 +0000
In-Reply-To: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@gmail.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWYgdGhpcyBpcyBzZXQsIHVzZSBpdCBpbnN0ZWFkIG9mIHRoZSB1c3VhbCBEZWJpYW5NaXJyb3JI
b3N0IGFuZApTdWJwYXRoLiAgTm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBjb25maWdzIHRoYXQg
ZG9uJ3Qgc2V0IGl0LgoKVGhpcyBpcyBub3Qgc3VmZmljaWVudCB0byB3b3JrIHJpZ2h0IHlldCwg
YmVjYXVzZSBzbmFwc2hvdHMKcmVwb3NpdG9yaWVzIGhhdmUgb3V0LW9mLWRhdGUgc2lnbmF0dXJl
cy4uLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4u
cG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCBjNjg1ODI1My4uZWU3ZTAzY2YgMTAwNjQ0Ci0t
LSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC05NDYsNiAr
OTQ2LDkgQEAgc3ViIHByZXNlZWRfYmFja3BvcnRzX3BhY2thZ2VzICgkJCQkQCkgewogICAgIG15
ICgkaG8sICRzZngsICR4b3B0cywgJHN1aXRlLCBAcGtncykgPSBAXzsKIAogICAgIGlmICghICR4
b3B0cy0+e0JhY2twb3J0c1NvdXJjZXNBbHJlYWR5QWRkZWR9KyspIHsKKwlteSAkYnBfdXJsID0g
JGN7IkRlYmlhblNuYXBzaG90QmFja3BvcnRzXyRzdWl0ZSJ9OworCSRicF91cmwgfHw9ICJodHRw
Oi8vJGN7RGViaWFuTWlycm9ySG9zdH0vJGN7RGViaWFuTWlycm9yU3VicGF0aH0iOworCiAJcHJl
c2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywgJHNmeCwgPDxFTkQpOwogIyEv
YmluL3NoCiBzZXQgLWV4CkBAIC05NTMsNyArOTU2LDcgQEAgc2V0IC1leAogY2F0IDw8RU9GID4+
L3RhcmdldC9ldGMvYXB0L3NvdXJjZXMubGlzdAogCiAjICRzdWl0ZSBiYWNrcG9ydHMKLWRlYiBo
dHRwOi8vJGN7RGViaWFuTWlycm9ySG9zdH0vJGN7RGViaWFuTWlycm9yU3VicGF0aH0gJHN1aXRl
LWJhY2twb3J0cyBtYWluCitkZWIgJGJwX3VybCAkc3VpdGUtYmFja3BvcnRzIG1haW4KIEVPRgog
aW4tdGFyZ2V0IGFwdC1nZXQgdXBkYXRlCiBFTkQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
