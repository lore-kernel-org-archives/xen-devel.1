From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC V2 37/45] x86: optimize loading of GDT
 at context switch
Date: Thu, 16 May 2019 06:42:42 -0600
Message-ID: <5CDD5AC2020000780022FA6A@prv1-mh.provo.novell.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-38-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRFie-0001nd-Ia
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:42:44 +0000
In-Reply-To: <20190506065644.7415-38-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGR5bmFtaWNhbGx5IGRlY2lkZSB3aGV0aGVyIHRoZSBwcmV2aW91cyB2Y3B1IHdhcyB1
c2luZyBmdWxsCj4gb3IgZGVmYXVsdCBHRFQganVzdCBhZGQgYSBwZXJjcHUgdmFyaWFibGUgZm9y
IHRoYXQgcHVycG9zZS4gVGhpcyBhdAo+IG9uY2UgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgdGVzdGlu
ZyB2Y3B1X2lkcyB0byBkaWZmZXIgdHdpY2UuCj4gCj4gQ2FjaGUgdGhlIG5lZWRfZnVsbF9nZHQo
bmQpIHZhbHVlIGluIGEgbG9jYWwgdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVG8gYmUgaG9uZXN0IEknbSBub3QgZW50aXJlbHkg
Y29udmluY2VkIHRoaXMgaXMgYSBnb29kIG1vdmUuIEJ1dApzaW5jZSB5b3UndmUgZG9uZSB0aGUg
d29yaywgYW5kIHNpbmNlIHRoZSBsYXJnZXIgc291cmNlIHNpemUgaXMKaG9wZWZ1bGx5IG91dHdl
aWdoZWQgYnkgc2xpZ2h0bHkgc21hbGxlciBiaW5hcnkgc2l6ZSAocGVyLUNQVQpkYXRhIGFjY2Vz
c2VzIGFyZW4ndCBlbnRpcmVseSBjaGVhcCBlaXRoZXIpLCBJJ20gbm90IGdvaW5nIHRvCm9iamVj
dC4KCj4gQEAgLTE2NTgsNiArMTY2NCw3IEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2go
dm9pZCkKPiAgICAgIHN0cnVjdCB2Y3B1ICAgICAgICAgICpuID0gY3VycmVudDsKPiAgICAgIHN0
cnVjdCBkb21haW4gICAgICAgICpwZCA9IHAtPmRvbWFpbiwgKm5kID0gbi0+ZG9tYWluOwo+ICAg
ICAgc2VnX2Rlc2NfdCAgICAgICAgICAgKmdkdDsKPiArICAgIGJvb2wgICAgICAgICAgICAgICAg
ICBuZWVkX2Z1bGxfZ2R0X247CgpUaGlzIHZhcmlhYmxlIGlzIHRvbyBsb25nLCBvciBtb3JlIHBy
ZWNpc2VseSBoYXMgdG9vIG1hbnkgdW5kZXJzY29yZXMKZm9yIG15IHRhc3RlLiBTZWVpbmcgdGhh
dCBvbmx5IGEgc2luZ2xlIGludm9jYXRpb24gb2YgbmVlZF9mdWxsX2dkdCgpCnJlbWFpbnMsIEkg
ZG9uJ3QgdGhpbmsganVzdCAiZnVsbF9nZHQiIHdvdWxkIGJlIGFtYmlndW91cyBpbiBhbnkgd2F5
LgpBdCB3aGljaCBwb2ludApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
