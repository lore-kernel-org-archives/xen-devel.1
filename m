From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 35/68] vfs: Convert xenfs to use the new
 mount API
Date: Tue, 2 Apr 2019 09:38:13 +0200
Message-ID: <ab60d95f-11a2-05c4-ef18-ffa904902881__36775.8653986797$1554190759$gmane$org@suse.com>
References: <155372999953.7602.13784796495137723805.stgit@warthog.procyon.org.uk>
 <155373029773.7602.5749182816677575121.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hBDzt-0000zm-1A
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 07:38:17 +0000
In-Reply-To: <155373029773.7602.5749182816677575121.stgit@warthog.procyon.org.uk>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Howells <dhowells@redhat.com>, viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwMDo0NCwgRGF2aWQgSG93ZWxscyB3cm90ZToKPiBDb252ZXJ0IHRoZSB4
ZW5mcyBmaWxlc3lzdGVtIHRvIHRoZSBuZXcgaW50ZXJuYWwgbW91bnQgQVBJIGFzIHRoZSBvbGQK
PiBvbmUgd2lsbCBiZSBvYnNvbGV0ZWQgYW5kIHJlbW92ZWQuICBUaGlzIGFsbG93cyBncmVhdGVy
IGZsZXhpYmlsaXR5IGluCj4gY29tbXVuaWNhdGlvbiBvZiBtb3VudCBwYXJhbWV0ZXJzIGJldHdl
ZW4gdXNlcnNwYWNlLCB0aGUgVkZTIGFuZCB0aGUKPiBmaWxlc3lzdGVtLgo+IAo+IFNlZSBEb2N1
bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21vdW50X2FwaS50eHQgZm9yIG1vcmUgaW5mb3JtYXRpb24u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4K
PiBjYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBjYzog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IGNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gY2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
