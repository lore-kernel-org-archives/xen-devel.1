From: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH v6 11/12] x86/microcode: Synchronize late
 microcode loading
Date: Thu, 14 Mar 2019 11:57:12 -0700
Message-ID: <20190314185712.GA20889@araj-mobl1.jf.intel.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-12-git-send-email-chao.gao@intel.com>
 <20190313000751.GF11608@araj-mobl1.jf.intel.com>
 <20190313050241.GA24657@gao-cwp>
 <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
 <5C88B92F020000780021DF64@prv1-mh.provo.novell.com>
 <d55bb90e-5ca4-0544-be5f-bbd0168c060a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S2MT=RR=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1h4VXX-0005d8-Jw
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 18:57:15 +0000
Content-Disposition: inline
In-Reply-To: <d55bb90e-5ca4-0544-be5f-bbd0168c060a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Borislav Petkov <bp@suse.de>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Mallick, Asit K" <asit.k.mallick@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Ashok Raj <ashok.raj@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3IAoKU29ycnkgaXQgdG9vayBhIHdoaWxlLCBzaW5jZSBJIGhhZCB0byBjaGVjayB3
aXRoIGNvdXBsZSBvdGhlcnMuCgorIEFzaXQKCk9uIFRodSwgTWFyIDE0LCAyMDE5IGF0IDEyOjM5
OjQ2UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6CltzbmlwXQo+IAo+IE9uIGxhdGUgbG9h
ZCBmYWlsdXJlLCB3ZSBzaG91bGQgZHVtcCBlbm91Z2ggaW5mb3JtYXRpb24gdG8gd29yayBvdXQK
PiBleGFjdGx5IHdoYXQgd2VudCBvbiwgdG8gZGV0ZXJtaW5lIGhvdyBiZXN0IHRvIHByb2NlZWQs
IGJ1dCB0aGUgc2VydmVyCj4gaXMgZWZmZWN0aXZlbHkgbG9zdCB0byB1cy7CoCBPbiBsYXRlIGxv
YWQgc3VjY2VzcywgdGhlIHByb3Bvc2VkIG5ldwo+ICJ2ZXJzaW9uIiByZXBsYWNlcyB0aGUgY3Vy
cmVudCAidmVyc2lvbiIuCj4gCj4gQW5kIGFnYWluIC0gSSByZWl0ZXJhdGUgdGhlIHBvaW50IHRo
YXQgSSB0aGluayBpdCBpcyBmaW5lIHRvIGhhdmUgYQo+IHNpbXBsaWZ5aW5nIGFzc3VtcHRpb24g
dGhhdCB3ZSBkb24ndCBoYXZlIG1peGVkIHN0ZXBwaW5nIHN5c3RlbXMgdG8KPiBzdGFydCB3aXRo
LCBwcmVzdW1pbmcgdGhpcyBpcyBnZW5lcmFsbHkgaW4gbGluZSB3aXRoIEludGVsJ3Mgc3VwcG9y
dAo+IHN0YXRlbWVudC7CoCBJZiBpbiBwcmFjdGljZSB3ZSBmaW5kIG1peGVkIHN0ZXBwaW5nIHN5
c3RlbXMgd2hpY2ggYXJlCj4gc3VwcG9ydGVkIGJ5IGFuIE9FTS9JbnRlbCwgd2UgY2FuIHNlZSBh
Ym91dCBleHRlbmRpbmcgdGhlIGxvZ2ljLgoKQ2hlY2tpbmcgd2l0aCBBc2l0IGhlIHNheXMgaXQg
aXMgaW4gZmFjdCBwZXJtaXR0ZWQgdG8gaGF2ZSAxIHN0ZXAgYmVoaW5kCmV2ZW4gb24gYSBtdWx0
aS1zb2NrZXQgc3lzdGVtLiBPbmUgY291bGQgYmUgTiBhbmQgb3RoZXIgTi0xIHNob3VsZCBiZSAK
c3VwcG9ydGVkLgoKQ2hlZXJzLApBc2hvawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
