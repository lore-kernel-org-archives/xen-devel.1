From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm/viridian: stop open coding updates
 to APIC registers
Date: Mon, 10 Dec 2018 06:44:26 -0700
Message-ID: <5C0E6DBA0200007800204ADE@prv1-mh.provo.novell.com>
References: <20181207175008.2146-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWLrL-0003eI-U6
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 13:44:31 +0000
In-Reply-To: <20181207175008.2146-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjEyLjE4IGF0IDE4OjUwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBjb2RlIGluIHZpcmlkaWFuX3N5bmljX3dybXNyKCkgZHVwbGljYXRlcyBsb2dpYyBp
biB2bGFwaWNfcmVnX3dyaXRlKCkKPiB0byB1cGRhdGUgdGhlIElDUiwgSUNSMiBhbmQgVEFTS1BS
SSByZWdpc3RlcnMuIEluc3RlYWQgb2YgZG9pbmcgdGhpcywKPiBtYWtlIHZsYXBpY19yZWdfd3Jp
dGUoKSBub24tc3RhdGljIGFuZCBjYWxsIGl0LgoKVGhlcmUncyBhIHNpZGUgZWZmZWN0IGZyb20g
dGhpcyBjaGFuZ2UsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGJlIGNhbGxlZApvdXQgc2luY2UgcGVy
aGFwcyBpdCdzIGFjdHVhbGx5IGEgKG1pbm9yKSBidWcgZml4OiB2bGFwaWNfcmVnX3dyaXRlKCkK
Y2xlYXJzIG91dCB2bGFwaWMtPmxvYWRlZCwgd2hpY2ggdGhlIG9wZW4gY29kZWQgVmlyaWRpYW4g
Y29kZSBkaWRuJ3QKZG8uCgpJZiBpdCB3YXNuJ3QgZm9yIHRoaXMsIEkgd291bGQgaGF2ZSBiZWVu
IHVuY2VydGFpbiB3aGV0aGVyIGV4cG9zaW5nIGEKZnVuY3Rpb24gdGhhdCByZWFsbHkgd2FzIG1l
YW50IHRvIGJlIHZsYXBpYy5jLWludGVybmFsIGlzIGEgZ29vZCBpZGVhLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
