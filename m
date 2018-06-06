From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 8/8] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Wed, 06 Jun 2018 06:38:29 -0600
Message-ID: <5B17D5C502000078001C8B49@prv1-mh.provo.novell.com>
References: <1528287897-3414-1-git-send-email-aisaila@bitdefender.com>
 <1528287897-3414-8-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528287897-3414-8-git-send-email-aisaila@bitdefender.com>
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

Pj4+IE9uIDA2LjA2LjE4IGF0IDE0OjI0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0zOTQsNyArMzgwLDcgQEAgc3RhdGljIGludCB2bWNlX2xvYWRfdmNwdV9jdHh0KHN0
cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ICAgICAgcmV0dXJuIGVy
ciA/OiB2bWNlX3Jlc3RvcmVfdmNwdSh2LCAmY3R4dCk7Cj4gIH0KPiAgCj4gLUhWTV9SRUdJU1RF
Ul9TQVZFX1JFU1RPUkUoVk1DRV9WQ1BVLCB2bWNlX3NhdmVfdmNwdV9jdHh0LAo+ICtIVk1fUkVH
SVNURVJfU0FWRV9SRVNUT1JFKFZNQ0VfVkNQVSwgdm1jZV9zYXZlX3ZjcHVfY3R4dF9vbmUsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1jZV9sb2FkX3ZjcHVfY3R4dCwgMSwgSFZNU1Jf
UEVSX1ZDUFUpOwoKQWxzbywgSSdtIGluY2xpbmVkIHRvIHNheSAib2YgY291cnNlIiwgdGhlIGZ1
bmN0aW9ucyBzaG91bGRuJ3QgaGF2ZSBhIF9vbmUKc3VmZml4IGFueW1vcmUgYnkgdGhlIGVuZCBv
ZiB0aGlzIHNlcmllcywgcG9zc2libHkgZXZlbiBtYWtpbmcgaXQKdW5uZWNlc3NhcnkgdG8gdG91
Y2ggdGhpcyBhbmQgdGhlIG90aGVyIHNpbWlsYXIgY29uc3RydWN0cyBhdCBhbGwuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
