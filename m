From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/3] xen/pt: fix some pass-thru devices
 don't work across reboot
Date: Fri, 21 Dec 2018 11:26:22 +0100
Message-ID: <20181221102622.2csul4nq4bsuf62w@mac.citrite.net>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
 <5C1CBCDE0200007800208727@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Efb1=O6=citrix.com=prvs=886684236=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gaI0m-00018V-UH
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:26:32 +0000
Content-Disposition: inline
In-Reply-To: <5C1CBCDE0200007800208727@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDM6MTM6NTBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQnV0IHRoZW4gYWdhaW4gSSdtIHN0aWxsIG5vdCBmdWxseSBjb252aW5jZWQgdGhhdCBh
IGh5cGVydmlzb3IKPiBjaGFuZ2UgaXMgdGhlIHJpZ2h0IGNvdXJzZSBvZiBhY3Rpb24gaGVyZSBp
biB0aGUgZmlyc3QgcGxhY2UuIEl0Cj4gd291bGQgYmUgYmV0dGVyIGlmIHRoZSBoeXBlcnZpc29y
IGhhZCB0byBqdXN0IHZlcmlmeSB0aGF0IGFsbAo+IElSUSBtYXBwaW5ncyBhcmUgZ29uZSwgb3Ig
ZWxzZSBmYWlsIHRoZSBkZS1hc3NpZ25tZW50IG9mIHRoZQo+IGRldmljZS4KClRoZSBvbmx5IGNv
bXBvbmVudCAoZXhjZXB0IHRoZSBoeXBlcnZpc29yKSB0aGF0IGtub3dzIGFib3V0IHN1Y2gKYXNz
aWdubWVudHMgaXMgUUVNVSwgYW5kIGluIHRoZSBjYXNlIG9mIGEgUUVNVSBjcmFzaCB0aGUgaG9z
dCB3b3VsZCBiZQpsZWZ0IHdpdGggYSBkZXZpY2UgdGhhdCBjYW5ub3QgYmUgZGUtYXNzaWduZWQs
IGJlY2F1c2UgdGhlIGluZm9ybWF0aW9uCmFib3V0IHRoZSBQSVJRIGJpbmRpbmdzIGluIGxvc3Qg
ZHVlIHRvIHRoZSBRRU1VIGNyYXNoLgoKSU1PIFhlbiBuZWVkcyB0byBiZSBjYXBhYmxlIG9mIGNs
ZWFuaW5nIGFueSBiaW5kaW5ncyBhbmQgbWFwcGluZ3MgZG9uZQpieSB0aGUgdG9vbHN0YWNrIG9y
IHRoZSBkZXZpY2UgbW9kZWwgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjb3JyZWN0bHkKcmVjb3Zl
ciBmcm9tIGEgZGV2aWNlIG1vZGVsIG9yIHRvb2xzdGFjayBjcmFzaC4KClJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
