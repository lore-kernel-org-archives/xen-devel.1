From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/4] xen/blkback: remove unused pers_gnts_lock
 from struct xen_blkif_ring
Date: Mon,  6 Aug 2018 13:34:03 +0200
Message-ID: <20180806113403.24728-6-jgross__43491.1108612598$1533555188$gmane$org@suse.com>
References: <20180806113403.24728-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=c1gs=kv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fmdmI-0000y1-KA
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 11:34:22 +0000
In-Reply-To: <20180806113403.24728-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

cGVyc19nbnRzX2xvY2sgaXNuJ3QgYmVpbmcgdXNlZCBhbnl3aGVyZS4gUmVtb3ZlIGl0LgoKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKaW5kZXggMjY3MTA2MDJkNDYzLi40
Yjc3NDcxNTljMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9u
LmgKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaApAQCAtMjc5LDcgKzI3
OSw2IEBAIHN0cnVjdCB4ZW5fYmxraWZfcmluZyB7CiAJd2FpdF9xdWV1ZV9oZWFkX3QJcGVuZGlu
Z19mcmVlX3dxOwogCiAJLyogVHJlZSB0byBzdG9yZSBwZXJzaXN0ZW50IGdyYW50cy4gKi8KLQlz
cGlubG9ja190CQlwZXJzX2dudHNfbG9jazsKIAlzdHJ1Y3QgcmJfcm9vdAkJcGVyc2lzdGVudF9n
bnRzOwogCXVuc2lnbmVkIGludAkJcGVyc2lzdGVudF9nbnRfYzsKIAlhdG9taWNfdAkJcGVyc2lz
dGVudF9nbnRfaW5fdXNlOwotLSAKMi4xMy43CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
