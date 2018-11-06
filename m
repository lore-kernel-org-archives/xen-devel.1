From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/8] x86/nestedhvm: introduce
 vvmcx_valid()
Date: Tue, 6 Nov 2018 09:58:26 -0500
Message-ID: <aebb9815-0735-12e5-1803-427e729f39f5@oracle.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
 <20181106120759.8789-3-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-3-sergey.dyasli@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvNi8xOCA3OjA3IEFNLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+IEFzIGEgY29udmVuaWVu
dCBoZWxwZXIgZnVuY3Rpb24gYW5kIHJlZmFjdG9yIHRoZSBjb2RlIHRvIHVzZSBpdC4KPgo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2Vy
Z2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IC0tLQo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2
ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IENDOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNA
YW1kLmNvbT4KPgo+IHYyOgo+IC0gVXNlIHRoZSBuZXcgaGVscGVyIGluIG5lc3RlZHN2bS5jCgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
