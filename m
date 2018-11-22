From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 22 Nov 2018 03:00:49 -0700
Message-ID: <5BF67E5102000078001FEC44@prv1-mh.provo.novell.com>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <e5dcca5e-6f19-f2d6-05f1-8659ea1dd2bb@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kqx2=ob=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPln4-0003vz-7O
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 10:00:54 +0000
In-Reply-To: <e5dcca5e-6f19-f2d6-05f1-8659ea1dd2bb@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai Dontu <mdontu@bitdefender.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDEwOjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIDIxLjExLjIwMTggMjA6NTUsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+ICsgICAg
ICAgICAgICBpZiAoIGEgPT0gdiApCj4+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4g
Kwo+Pj4gKyAgICAgICAgICAgIC8qIFBhdXNlLCBzeW5jZWQuICovCj4+PiArICAgICAgICAgICAg
d2hpbGUgKCAhYS0+YXJjaC5pbl9ob3N0ICkKPj4gV2h5IG5vdCB1c2UgYS0+aXNfcnVubmluZyBh
cyBhIHdheSB0byBrbm93IHdoZXRoZXIgdGhlIHZDUFUgaXMKPj4gcnVubmluZz8KPj4gCj4+IEkg
dGhpbmsgdGhlIGxvZ2ljIG9mIHVzaW5nIHZjcHVfcGF1c2UgYW5kIGV4cGVjdGluZyB0aGUgcnVu
bmluZyB2Y3B1Cj4+IHRvIHRha2UgYSB2bWV4aXQgYW5kIHRodXMgc2V0IGluX2hvc3QgaXMgd3Jv
bmcgYmVjYXVzZSBhIHZjcHUgdGhhdAo+PiB3YXNuJ3QgcnVubmluZyB3aGVuIHZjcHVfcGF1c2Vf
bm9zeW5jIGlzIGNhbGxlZCB3b24ndCBnZXQgc2NoZWR1bGVkCj4+IGFueW1vcmUsIHRodXMgbm90
IHRha2luZyBhIHZtZXhpdCBhbmQgdGhpcyBmdW5jdGlvbiB3aWxsIGxvY2t1cC4KPiAKPiBXZSBj
YW4gcmVzb2x2ZSB0aGlzIGJ5IHVzaW5nIHdoaWxlICggIXZjcHVfcnVubmFibGUoYSkgJiYgCj4g
IWEtPmFyY2guaW5faG9zdCApLCBpZiB0aGlzIGlzIHN1aXRhYmxlLgoKT25seSBpZiB5b3UgY2Fu
IGZ1bGx5IGV4cGxhaW4gd2h5IHRoZSBjdXJyZW50IGluZnJhc3RydWN0dXJlIGRvZXNuJ3QKd29y
ayBhbmQgY2FuJ3QgYmUgbWFkZSB3b3JrIHdpdGhvdXQgdGhlIGN1c3RvbSBpbl9ob3N0IGZsYWcu
CkZyb20gcHJpb3Igd29yayBJIGtub3cgdGhpbmdzIGFyZSBzdWJ0bGUgaW4gc29tZSBjYXNlcyB3
aGVyZSBvbmUKd291bGQgd2FudCB0byB1c2UgLT5pc19ydW5uaW5nLCBidXQgc28gZmFyIGFsbCBp
c3N1ZXMgY291bGQgYmUKcmVzb2x2ZWQgd2l0aG91dCBjdXN0b20gYWRkaXRpb25zLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
