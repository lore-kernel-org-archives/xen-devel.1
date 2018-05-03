From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/3] xen/store: do not store local values in
 xen_start_info
Date: Thu, 3 May 2018 15:45:25 +0100
Message-ID: <20180503144525.61065-1-roger.pau__14972.5383650095$1525358678$gmane$org@citrix.com>
References: <20180503143646.60747-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=61fa=hw=citrix.com=prvs=654947d1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fEFUY-0003nX-TG
 for xen-devel@lists.xenproject.org; Thu, 03 May 2018 14:45:54 +0000
In-Reply-To: <20180503143646.60747-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIHRvIHN0b3JlIHRoZSB4ZW5zdG9yZSBwYWdlIG9yIGV2ZW50IGNoYW5u
ZWwgaW4KeGVuX3N0YXJ0X2luZm8gaWYgdGhleSBhcmUgbG9jYWxseSBpbml0aWFsaXplZC4KClRo
aXMgYWxzbyBmaXhlcyBQVkggbG9jYWwgeGVuc3RvcmUgaW5pdGlhbGl6YXRpb24gZHVlIHRvIHRo
ZSBsYWNrIG9mCnhlbl9zdGFydF9pbmZvIGluIHRoYXQgY2FzZS4KClNpZ25lZC1vZmYtYnk6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBk
cml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmUuYwppbmRleCBlYzllYjRmYmE1OWMuLmYyMDg4ODM4ZjY5MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYwpAQCAtNzEwLDcgKzcxMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbnN0b3Jl
ZF9sb2NhbF9pbml0KHZvaWQpCiAJaWYgKCFwYWdlKQogCQlnb3RvIG91dF9lcnI7CiAKLQl4ZW5f
c3RvcmVfZ2ZuID0geGVuX3N0YXJ0X2luZm8tPnN0b3JlX21mbiA9IHZpcnRfdG9fZ2ZuKCh2b2lk
ICopcGFnZSk7CisJeGVuX3N0b3JlX2dmbiA9IHZpcnRfdG9fZ2ZuKCh2b2lkICopcGFnZSk7CiAK
IAkvKiBOZXh0IGFsbG9jYXRlIGEgbG9jYWwgcG9ydCB3aGljaCB4ZW5zdG9yZWQgY2FuIGJpbmQg
dG8gKi8KIAlhbGxvY191bmJvdW5kLmRvbSAgICAgICAgPSBET01JRF9TRUxGOwpAQCAtNzIyLDgg
KzcyMiw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbnN0b3JlZF9sb2NhbF9pbml0KHZvaWQpCiAJ
CWdvdG8gb3V0X2VycjsKIAogCUJVR19PTihlcnIpOwotCXhlbl9zdG9yZV9ldnRjaG4gPSB4ZW5f
c3RhcnRfaW5mby0+c3RvcmVfZXZ0Y2huID0KLQkJYWxsb2NfdW5ib3VuZC5wb3J0OworCXhlbl9z
dG9yZV9ldnRjaG4gPSBhbGxvY191bmJvdW5kLnBvcnQ7CiAKIAlyZXR1cm4gMDsKIAotLSAKMi4x
Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
