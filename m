From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/8] x86/nestedhvm: init nv_vvmcxaddr in
 hvm_vcpu_initialise()
Date: Wed, 14 Nov 2018 06:46:47 -0700
Message-ID: <5BEC274702000078001FC01C@prv1-mh.provo.novell.com>
References: <20181114102323.7771-1-sergey.dyasli@citrix.com>
 <20181114102323.7771-2-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181114102323.7771-2-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDExOjIzLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBUaGlzIGFsbG93cyB0byBzYWZlbHkgdXNlIG5lc3RlZGh2bSBmdW5jdGlvbnMgdGhhdCBy
ZWx5IG9uIHRoZSB2YWx1ZXMKPiBpbnNpZGUgc3RydWN0IG5lc3RlZHZjcHUgaW5kZXBlbmRlbnRs
eSBvZiB0aGUgbmVzdGVkIHZpcnR1YWxpc2F0aW9uCj4gKEhWTV9QQVJBTV9ORVNURURIVk0pIHN0
YXR1cyBvZiBhIGRvbWFpbi4KClN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
