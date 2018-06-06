From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/11] x86/svm Fixes and cleanup to
 svm_inject_event()
Date: Wed, 06 Jun 2018 07:37:52 -0600
Message-ID: <5B17E3B002000078001C8BEF@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

ID4+PiBPbiAwNC4wNi4xOCBhdCAxNTo1OSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+ICogU3RhdGUgYWRqdXN0bWVudHMgKGFuZCBkZWJ1ZyB0cmFjaW5nKSBmb3IgI0RCLyNC
UC8jUEYgc2hvdWxkIG5vdCBiZSBkb25lCj4gICAgZm9yIGBpbnQgJG5gIGluc3RydWN0aW9ucy4g
IFVwZGF0ZXMgdG8gJWNyMiBvY2N1ciBldmVuIGlmIHRoZSBleGNlcHRpb24KPiAgICBjb21iaW5l
cyB0byAjREYuCj4gICogRG9uJ3Qgb3BlbmNvZGUgRFJfU1RFUCB3aGVuIHVwZGF0aW5nICVkcjYu
Cj4gICogU2ltcGxpZnkgdGhlIGxvZ2ljIGZvciBjYWxsaW5nIHN2bV9lbXVsX3N3aW50X2luamVj
dGlvbigpIGFzIGluIHRoZSBjb21tb24KPiAgICBjYXNlLCBldmVyeSBjb25kaXRpb24gbmVlZHMg
Y2hlY2tpbmcuCj4gICogRml4IGNvbW1lbnRzIHdoaWNoIGhhdmUgYmVjb21lIHN0YWxlIGFzIGNv
ZGUgaGFzIG1vdmVkIGJldHdlZW4gY29tcG9uZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
