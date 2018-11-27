From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Tue, 27 Nov 2018 13:44:09 +0200
Message-ID: <04bd4ccd-c6d5-4891-7b20-0cc185c8f34c@bitdefender.com>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
 <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
 <5BFD2A520200007800200528@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FTPm=OG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gRbmw-0005Uy-Ou
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 11:44:22 +0000
In-Reply-To: <5BFD2A520200007800200528@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai Dontu <mdontu@bitdefender.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4gQWJvdXQgdGhlIGVtdWxhdG9yIGFuZCBldmVudHM6IGlmIHdlIGNvdWxkIGhhdmUgYSB0b2dn
bGUgZm9yIHRoZQo+PiBlbXVsYXRvciB0byB0ZWxsIGl0ICJlbXVsYXRlIHRoZSBjdXJyZW50IGlu
c3RydWN0aW9uIGFuZCBzZW5kIG91dCBhCj4+IHZtX2V2ZW50IG9ubHkgaWYgaXQgdG91Y2hlcyBh
IHByb3RlY3RlZCBwYWdlIHRoYXQncyBOT1QgcGFydCBvZiB0aGUgcGFnZQo+PiB3YWxrIiwgdGhh
dCB3b3VsZCBhbHNvIHdvcmsgLSB0aG91Z2ggSSBjYW4ndCBhdCB0aGlzIHBvaW50IHRlbGwgaG93
Cj4+IGZlYXNpYmxlIHRob3NlIG1vZGlmaWNhdGlvbnMgYXJlLgo+IAo+IEZvciB0aGUgZW11bGF0
aW9uIHBhdGhzIGl0IGlzIGNlcnRhaW5seSBwb3NzaWJsZSB0byBoYXZlIGNvbnRyb2xzIGZvcgo+
IChhbG1vc3QpIGV2ZXJ5dGhpbmcsIGlmIG5lZWRlZC4gU28gZ29pbmcgdGhhdCByb3V0ZSBjb250
aW51ZXMgdG8KPiBsb29rIG1vcmUgZGVzaXJhYmxlIHRvIG1lIHRoYW4gZ29pbmcgdGhlIHJvdXRl
IHlvdSd2ZSBjaG9zZW4uCgpJdCBkb2VzIHNvdW5kIHZlcnkgcmVhc29uYWJsZSwgd2UnbGwgbG9v
ayBpbnRvIHRoYXQuCgo+PiBUaGUgYmlnZ2VyIHByYWN0aWNhbCBwcm9ibGVtIGlzIGhhdmluZyBz
b21ldGhpbmcgdGhhdCB3b3JrcyB3aXRoIG9sZGVyCj4+IFhlbiB2ZXJzaW9ucyAtIGZvciBleGFt
cGxlIGN1cnJlbnQgWGVuU2VydmVyIHJlbGVhc2VzIGFyZSBzdGlsbCBvbiBYZW4KPj4gNC43LCBh
bmQgYmFja3BvcnRpbmcgdGhlIHdob2xlIGVtdWxhdG9yIG1hY2hpbmVyeSB0aGVyZSBpcyBub3QK
Pj4gcmVhc29uYWJsZSwgd2l0aCB0aGUgbGFyZ2UgbnVtYmVyIG9mIGNoYW5nZXMgdGhhdCBoYXZl
IG9jY3VyZWQgaW4gdGhlCj4+IG1lYW50aW1lLgo+Cj4gV2VsbCAtIHdvdWxkbid0IHRoaXMgYXBw
bHkgdG8gZXh0ZW5zaXZlIGFsdHAybSBjaGFuZ2VzIGFzIHdlbGw/CgpJdCBkb2VzLCBob3dldmVy
IGZvciBvbmUsIGZvciBzb21lIHJlYXNvbiB0aGUgYWx0cDJtIHBhdGNoZXMgaGF2ZSBzbyBmYXIK
cHJvdmVuIChmb3IgdXMgYXQgbGVhc3QpIG11Y2ggZWFzaWVyIHRvIGJhY2twb3J0IChhbmQgdGhl
cmUncyBsZXNzIG9mIHRoZW0pLgoKSG93ZXZlciwgeW91IGRvIG1ha2UgYSBnb29kIHBvaW50LCBh
bmQgYXNzdW1pbmcgdGhpcyB3b3JrcyBlbXVsYXRvcgpjaGFuZ2VzIGRvIHNlZW0gdG8gcG90ZW50
aWFsbHkgc29sdmUgdGhlIHByb2JsZW0gd2UncmUgaGF2aW5nIGluIGEgd2F5CnRoYXQncyBhY2Nl
cHRhYmxlIHRvIGV2ZXJ5b25lIGFuZCBpcyBhcmNoaXRlY3R1cmFsbHkgY29ycmVjdC4KCgpUaGFu
a3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
