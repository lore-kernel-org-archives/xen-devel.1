From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Thu, 1 Nov 2018 14:23:47 +0000
Message-ID: <f1eafe1f-71ab-9875-af3f-bf0217bbcb35__46316.1122090698$1541082394$gmane$org@citrix.com>
References: <20181101123307.8424-1-jgross@suse.com>
 <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ireg=nm=citrix.com=prvs=8364524b4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIDwt-0001rq-TZ
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:27:51 +0000
In-Reply-To: <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMTggMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4gMTEvMDEvMTggMTozNCBQTSA+Pj4KPj4gQ3VycmVudGx5IHRoZSBz
aXplIG9mIGh5cGVyY2FsbCBidWZmZXJzIGFsbG9jYXRlZCB2aWEKPj4gL2Rldi94ZW4vaHlwZXJj
YWxsIGlzIGxpbWl0ZWQgdG8gYSBkZWZhdWx0IG9mIDY0IG1lbW9yeSBwYWdlcy4gRm9yIGxpdmUK
Pj4gbWlncmF0aW9uIG9mIGd1ZXN0cyB0aGlzIG1pZ2h0IGJlIHRvbyBzbWFsbCBhcyB0aGUgcGFn
ZSBkaXJ0eSBiaXRtYXNrCj4+IG5lZWRzIHRvIGJlIHNpemVkIGFjY29yZGluZyB0byB0aGUgc2l6
ZSBvZiB0aGUgZ3Vlc3QuIFRoaXMgbWVhbnMKPj4gbWlncmF0aW5nIGEgOEdCIHNpemVkIGd1ZXN0
IGlzIGFscmVhZHkgZXhoYXVzdGluZyB0aGUgZGVmYXVsdCBidWZmZXIKPj4gc2l6ZSBmb3IgdGhl
IGRpcnR5IGJpdG1hcC4KPj4KPj4gVGhlcmUgaXMgbm8gc2Vuc2libGUgd2F5IHRvIHNldCBhIHNh
bmUgbGltaXQsIHNvIGp1c3QgcmVtb3ZlIGl0Cj4+IGNvbXBsZXRlbHkuIFRoZSBkZXZpY2Ugbm9k
ZSdzIHVzYWdlIGlzIGxpbWl0ZWQgdG8gcm9vdCBhbnl3YXksIHNvIHRoZXJlCj4+IGlzIG5vIGFk
ZGl0aW9uYWwgRE9TIHNjZW5hcmlvIGFkZGVkIGJ5IGFsbG93aW5nIHVubGltaXRlZCBidWZmZXJz
Lgo+IEJ1dCBpcyB0aGlzIHNldHRpbmcgb2YgcGVybWlzc2lvbnMgd2hhdCB3ZSB3YW50IGxvbmcg
dGVybT8gV2hhdCBhYm91dCBhCj4gZGUtcHJpdmlsZWdlZCBxZW11LCB3aGljaCBzdGlsbCBuZWVk
cyB0byBiZSBhYmxlIHRvIGlzc3VlIGF0IGxlYXN0IGRtLW9wCj4gaHlwZXJjYWxscz8KCmRtLW9w
IHZlcnkgZGVsaWJlcmF0ZWx5IGRvZXNuJ3QgaGF2ZSBoeXBlcmNhbGwgYm91bmNlIGJ1ZmZlcnMg
bGlrZSB0aGlzLgoKVGhlIGtlcm5lbCBpcyByZXNwb25zaWJsZSBmb3IgZW5zdXJpbmcgdGhhdCB0
aGUgYnVmZmVyIGxpc3QgcGFzc2VkIGluCnRoZSBpb2N0bCBpcyBzYWZlIG1lbW9yeSwgd2hldGhl
ciB0aGlzIGlzIGJvdW5jaW5nIHRoZSBidWZmZXJzIGl0c2VsZiwKb3Igc2ltcGx5IGVuc3VyaW5n
IHRoYXQgdGhlIHVuZGVybHlpbmcgdXNlcnNwYWNlIG1lbW9yeSB3b24ndCBkaXNhcHBlYXIKYWNy
b3NzIHRoZSBoeXBlcmNhbGwuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
