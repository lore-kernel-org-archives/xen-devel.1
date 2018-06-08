From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/11] x86: Fix merging of new status bits
 into %dr6
Date: Fri, 08 Jun 2018 07:09:51 -0600
Message-ID: <5B1A801F02000078001C97C5@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-10-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-10-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE4IGF0IDE1OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGN1cnJlbnQgbG9naWMgdXNlZCB0byB1cGRhdGUgJWRyNiB3aGVuIGluamVjdGlu
ZyAjREIgaXMgYnVnZ3kuICBUaGUKPiBhcmNoaXRlY3R1cmFsIGJlaGF2aW91ciBpcyB0byBvdmVy
d3JpdGUgQnswLi4zfSAocmF0aGVyIHRoYW4gYWNjdW11bGF0ZSkgYW5kCj4gYWNjdW11bGF0ZSBh
bGwgb3RoZXIgYml0cy4KPiAKPiBJbnRyb2R1Y2UgYSBuZXcgbWVyZ2VfZHI2KCkgaGVscGVyLCB3
aGljaCBhbHNvIHRha2VzIGNhcmUgb2YgaGFuZGluZyBSVE0KPiBjb3JyZWN0bHkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFo
LCBoZXJlIHdlIGdvLiBUaGlzIGFzIHdlbGwgYXMgcGF0Y2ggNzoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
