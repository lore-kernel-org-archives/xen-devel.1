From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: add SLES 11 SP4 dockerfile
Date: Wed, 18 Jul 2018 10:51:44 +0100
Message-ID: <20180718095144.hz25ngo74ot2yrzn@citrix.com>
References: <20180717200305.4067-1-wei.liu2@citrix.com>
 <20180718094404.GA8304@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffj7c-0005oR-AJ
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:51:48 +0000
Content-Disposition: inline
In-Reply-To: <20180718094404.GA8304@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMTE6NDQ6NDBBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBKdWwgMTcsIFdlaSBMaXUgd3JvdGU6Cj4gCj4gPiBObyBPVk1GIGJlY2F1
c2UgaXQgcmVxdWlyZXMgZ2NjIDQuNCBvciBsYXRlci4KPiAKPiBGaW5lLgo+IAo+ID4gTm8gc2Vh
YmlvcyBiZWNhdXNlIGl0IHJlcXVpcmVzIGFub255bW91cyB1bmlvbiBpbml0aWFsaXNhdGlvbgo+
IAo+IEl0IGlzIHJlcXVpcmVkIHRvIGJ1aWxkIFhlbiBsaWtlIHRoYXQgKHdpdGggYSBjdXN0b20g
Y29tcGlsZXIgZnJvbSBnY2M0OC5ycG0pOgo+IAo+IHRlc3QgLXggIiQodHlwZSAtcCBnY2MpIiAm
JiBDQz0kXwo+IHRlc3QgLXggIiQodHlwZSAtcCBnY2MtNC44KSIgJiYgQ0M9JF8KPiBtYWtlIFwK
PiAgICAgICAgIENDPSRDQyBcCj4gICAgICAgICBIT1NUQ0M9JENDIFwKPiAgICAgICAgIHhlbgo+
IAo+IG1ha2UgXAo+ICAgICAgICAgQ0M9JENDIFwKPiAgICAgICAgIEdDQz0kQ0MgXAo+ICAgICAg
ICAgSE9TVENDPSRDQyBcCj4gICAgICAgICBIT1NUX0NDPSRDQyBcCj4gICAgICAgICBCVUlMRF9D
Qz0kQ0MgXAo+ICAgICAgICAgdG9vbHMgc3R1YmRvbQoKSSBqdXN0IHB1c2hlZCBhIG5ldyBiYXNl
IGltYWdlIHdoaWNoIGNvbnRhaW5lZCBnY2MtNC44LiBJbmRpdmlkdWFsCmRldmVsb3BlcnMgY2Fu
IHVzZSB0aGUgcnVuZXMgaGVyZSBpZiB0aGV5IGNhcmUgdG8gYnVpbGQgc2VhYmlvcy4KCkZ1cnRo
ZXIgYWRqdXN0bWVudCB0byB0aGUgYnVpbGQgc2NyaXB0IGlzIG5lZWRlZCBpZiB3ZSByZWFsbHkg
Y2FyZSBhYm91dApidWlsZGluZyBzZWFiaW9zIGluIGdpdGxhYiBDSS4gQnV0IHdlIGRvbid0IGV2
ZW4ga25vdyBpZiB3ZSBjYW4gcnVuIHRoaXMKY29udGFpbmVyIG9uIGdpdGxhYiBDSSB5ZXQuIDot
KQoKPiAKPiA+IE5vIFFFTVUgdXBzdHJlYSBiZWNhdXNlIHNlZCBkb2Vzbid0IHN1cHBvcnQgLUUu
Cj4gCj4gbGlidmlydCtRRU1VIHVwc3RyZWFtIGRvZXMgbm90IHN1cHBvcnQgU0xFMTEgYW55bW9y
ZSBkdWUgdG8gdGhlCj4gcmVxdWlyZW1lbnQgZm9yIGEgbmV3ZXIgZ2xpYjIuIEluIGNhc2UgWGVu
IHdhbnRzIHRvIHN0aWNrIHdpdGggcWVtdS0yLjEyCj4gZm9yIGEgd2hpbGUsIFNMRTExIGNvdWxk
IHN0aWxsIGJlIHRlc3RlZCBmb3IgZnVuIGFuZCBlZHVjYXRpb24uCgpJIHRoaW5rIHRoZSBzYW1l
IHByaW5jaXBsZSBtZW50aW9uZWQgYWJvdmUgYXBwbGllcyBoZXJlIGFzIHdlbGwuCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
