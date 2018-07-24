From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v13 02/11] x86/hvm: Introduce
 hvm_save_tsc_adjust_one() func
Date: Tue, 24 Jul 2018 02:25:13 -0600
Message-ID: <5B56E26902000078001D7040@prv1-mh.provo.novell.com>
References: <1532009289-14416-1-git-send-email-aisaila@bitdefender.com>
 <1532009289-14416-3-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1532009289-14416-3-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDE2OjA4LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gQEAgLTc0MCwxNiArNzQwLDIzIEBAIHZvaWQgaHZtX2RvbWFpbl9kZXN0cm95KHN0
cnVjdCBkb21haW4gKmQpCj4gICAgICBkZXN0cm95X3ZwY2lfbW1jZmcoZCk7Cj4gIH0KPiAgCj4g
K3N0YXRpYyBpbnQgaHZtX3NhdmVfdHNjX2FkanVzdF9vbmUoc3RydWN0IHZjcHUgKnYsIGh2bV9k
b21haW5fY29udGV4dF90ICpoKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaHZtX3RzY19hZGp1c3QgY3R4
dCA9IHt9Owo+ICsKPiArICAgIGN0eHQudHNjX2FkanVzdCA9IHYtPmFyY2guaHZtX3ZjcHUubXNy
X3RzY19hZGp1c3Q7CgpDb25zaWRlcmluZyBlYXJsaWVyIGNvbW1lbnRzLCB3aHkgaXMgdGhpcyBz
dGlsbCBub3QgcGFydCBvZiB0aGUKaW5pdGlhbGl6ZXI/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
