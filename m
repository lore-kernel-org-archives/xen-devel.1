From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 10/10] x86: Handle new asynchronous exit
 qualification
Date: Fri, 29 Jun 2018 16:29:56 +0100
Message-ID: <3b5c5286-fa6d-7819-bd87-6b908a6f935f@citrix.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-11-git-send-email-luwei.kang@intel.com>
 <5B364ECB02000078001CF440@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B364ECB02000078001CF440@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Luwei Kang <luwei.kang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDYvMTggMTY6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA1LjE4IGF0
IDE1OjI4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+PiBVc2luZyBFUFQgdG8gdHJh
bnNsYXRlIFBUIG91dHB1dCBhZGRyZXNzZXMgaW50cm9kdWNlcyB0aGUgcG9zc2liaWxpdHkgb2YK
Pj4gdGFraW5nIGV2ZW50cyBvbiBQVCBvdXRwdXQgcmVhZHMgYW5kIHdyaXRlcy4gRXZlbnQgcG9z
c2liaWxpdGllcyBpbmNsdWRlCj4+IEVQVCB2aW9sYXRpb25zLCBFUFQgbWlzY29uZmlndXJhdGlv
bnMsIFBNTCBsb2ctZnVsbCBWTSBleGl0cywgYW5kIEFQSUMKPj4gYWNjZXNzIFZNIGV4aXRzLgo+
PiBFUFQgdmlvbGF0aW9uczoKPj4gIGEuIEludGVsIFBUIGJ1ZmZlciBpcyBhIE1NSU8gYWRkcmVz
cyBpbiBndWVzdC4gQWN0dWFsbHksIGl0IGNhbiBiZSBhCj4+ICAgICBNTUlPIGFkZHJlc3MgKFNE
TSAzNS4yLjYuMSksIGJ1dCBpbiBvcmRlciBkbyBub3QgYWZmZWN0IG90aGVyCj4+ICAgICBwYXNz
dGhyb3VnaC9lbXVsYXRlIGRldmljZSBpbiBndWVzdC4gRmVyYmlkIHVzZSBNTUlPIGFkZHIgYXQg
cHJlc2VudC4KPj4gIGIuIEludGVsIFBUIGJ1ZmZlciBpcyBhIFJBTSBub24td3JpdGFibGUgYWRk
cmVzcy4gRG9uJ3QgbmVlZCBlbXVsYXRlCj4+ICAgICBhbmQgaW5qZWN0IGEgI0dQIHRvIGd1ZXN0
Lgo+IElzIHN1Y2ggI0dQIGluamVjdGlvbiBhcmNoaXRlY3R1cmFsIGJlaGF2aW9yPyBXZSd2ZSBn
b3QgYSBmZXcgYmFkCj4gZXhhbXBsZXMgd2hlcmUgd2UgaW5qZWN0IGV4Y2VwdGlvbnMgd2hpY2gg
YXJlIGFyY2hpdGVjdHVyYWxseQo+IGltcG9zc2libGUgLSBsZXQncyBwbGVhc2Ugbm90IGFkZCBh
bnkgZnVydGhlciBpbnN0YW5jZXMuCgpXZSBkaXNjdXNzZWQgdGhpcyBJUkwsIGFuZCB0aGlzIHBv
aW50IHdhcyBhbHRlcmVkLgoKV2UgbmVlZCB0byBydW4gdGhlIGVwdF92aW9sYXRpb24gaGFuZGxl
ciAoZS5nLiB0byBhY2NvdW50IGZvciBsb2dkaXJ0eQp0cmFja2luZykgYW5kIGl0IGFsc28gZ2l2
ZXMgYW4gaW50cm9zcGVjdGlvbiBhZ2VudCBhIGNoYW5jZSB0byBpbnRlcnZlbmUKKGUuZy4gcmVt
b3ZlIHByb3RlY3Rpb24gb24gdGhlIHBhZ2UgaWYgaXRzIHVzZSBhcyBhIFBUIGJ1ZmZlciBpcwps
ZWdpdGltYXRlKS4KCkhvd2V2ZXIsIGlmIHRoZSB2aW9sYXRpb24gaXNuJ3QgZml4ZWQgKG1ha2lu
ZyB0aGUgZnJhbWUgd3JpdGVhYmxlIGluCkVQVCwgb3Iga2lsbGluZyBQVCksIHRoZSBndWVzdCBj
YW5ub3QgY29udGludWUgZXhlY3V0aW5nIGNyYXNoaW5nIGlzIHRoZQpvbmx5IHJlbWFpbmluZyBv
cHRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
