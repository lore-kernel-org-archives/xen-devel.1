From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v2] xen/pt: fix some pass-thru devices don't
 work across reboot
Date: Mon, 19 Nov 2018 21:20:57 +0800
Message-ID: <20181119132055.GA19865@gao-cwp>
References: <1542244226-35003-1-git-send-email-chao.gao@intel.com>
 <20181115104039.geyiusafhsq4q7x4@mac>
 <20181116075348.GA6684@gao-cwp>
 <20181116093529.4ucjehnm75tulsdq@mac>
 <5BEE950D02000078001FCAFA@prv1-mh.provo.novell.com>
 <20181116143011.z6ydirxyxlf4migk@mac>
 <20181119124519.GA18130@gao-cwp>
 <5BF2B2AC02000078001FD75D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eeom=N6=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gOjQZ-00043b-5b
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:17:23 +0000
Content-Disposition: inline
In-Reply-To: <5BF2B2AC02000078001FD75D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDU6NTU6MDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTkuMTEuMTggYXQgMTM6NDUsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBBbm90aGVyIHNvbHV0aW9uIGNhbWUgdG8gbXkgbWluZDoKPj4gCj4+IFRoZSBpbnRlbnRp
b24gb2YgWGVuIHNldHRpbmcgJ2hvc3RfbWFza2FsbCcgaXMgdG8gbWFzayBhIHNpbmdsZSB2ZWN0
b3IuIEhvdwo+PiBhYm91dCBjb252ZXJ0aW5nIHRoZSBob3N0X21hc2thbGwgdG8gbWFzayBhbGwg
dmVjdG9ycyB3aGVuIFhlbiB0cmllcyB0byBpbml0IAo+PiB0aGUgZmlyc3QgdmVjdG9yIGluIG1z
aXhfY2FwYWJpbGl0eV9pbml0KCk/IEFjdHVhbGx5LCBvbiBoYXJkd2FyZSwgYWxsCj4+IHZlY3Rv
cidzIG1hc2sgYml0IGlzIGFscmVhZHkgc2V0IHdoZW4gcGNpYmFjayBpcyBwZXJmb3JtaW5nIGRl
dmljZSByZXNldC4gU28KPj4gaXQgd29uJ3QgYnJlYWsgYW55dGhpbmcuIFdpdGggY29tbWl0IDY5
ZDk5ZDFiMjIzLCBldmVuIGEgZ3Vlc3QgaGFzIGNsZWFyZWQKPj4gc29tZSB2ZWN0b3JzJyBtYXNr
IGJpdCBiZWZvcmUgdGhlIGNvbnZlcnRpb24sIGl0IHdvbid0IGJlIGFuIGlzc3VlLgo+Cj5CdXQg
d2UgYWxyZWFkeSBtYXNrIHZlY3RvcnMgaW4gbXNpeF9jYXBhYmlsaXR5X2luaXQoKS4gSSB0aG91
Z2h0IHdlIGhhZAo+YWxyZWFkeSBzZXR0bGVkIHRoYXQgaWYgd2UgY2FtZSB0aHJvdWdoIHRoaXMg
ZnVuY3Rpb24gYmVmb3JlIGFzc2lnbmluZwo+dGhlIGRldmljZSB0byBhIChuZXcgb3Igc2FtZS9y
ZXN0YXJ0aW5nKSBndWVzdCwgYWxsIG91Z2h0IHRvIGJlIGZpbmU6Cj5XaGVuIHdlIGNvbWUgaGVy
ZSBmb3IgdGhlIGZpcnN0IGVudHJ5LCB3ZSBhbHNvIHR1cm4gb2ZmIGhvc3RfbWFza2FsbC4KClll
cywgaXQgaXMgcmVhc29uYWJsZS4KCj5UaGF0J3Mgd2h5IHdlJ3ZlIGJlZW4gc3VnZ2VzdGluZyB0
byBnbyB0aHJvdWdoIGEgcmVsZWFzZS9wcmVwYXJlCj5jeWNsZS4KCldpbGwgZm9sbG93IHlvdXIg
c3VnZ2VzdGlvbi4KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
