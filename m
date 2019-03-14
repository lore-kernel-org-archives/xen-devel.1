From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 15:24:59 +0100
Message-ID: <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4RI7-0003Vm-Mg
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:25:03 +0000
In-Reply-To: <20190314151416.625d8cfa.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNToxNCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gVGh1LCAxNCBNYXIg
MjAxOSAxNToxMDoxNiArMDEwMAo+IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjoKPiAKPj4gVGhpcyB3b3VsZCBiZSB0aGUgbGVhc3QgaW50cnVzaXZlIGNoYW5nZSBhbGxv
d2luZyBtYXhpbXVtIGZsZXhpYmlsaXR5Cj4+IElNTy4KPiAKPiBJIHRoaW5rIGVhcmxpZXIgYXR0
ZW1wdHMgZGlkIGFsdGVyIHRoZSB0b29saW5nLgo+IEJ1dCB0aGF0IHdvdWxkIG5vdCBoZWxwIHdp
dGggZXhpc3RpbmcgZG9tVXMgc3RhcnRlZCBvbiBob3N0cyB0aGF0IGRvIG5vdCBoYXZlIHRoYXQg
cHJvcGVydHkuCgpZZXMuIFRoaXMgaGFwcGVucyB3aGVuIGludHJvZHVjaW5nIG5ldyBmZWF0dXJl
cy4KCj4gQSBnbG9iYWwga25vYiB3b3VsZCBoZWxwIHdpdGggdGhhdC4KCkkgYmVsaWV2ZSBhIHBl
ci1kb21haW4gY29udHJvbGxhYmxlIHZhbHVlIGlzIHRvIGJlIHByZWZlcnJlZC4gRGlmZmVyZW50
Cmd1ZXN0cyBtaWdodCBoYXZlIGRpZmZlcmVudCBqaXR0ZXIgdG9sZXJhbmNlLgoKQW5kIGV2ZW4g
dGhlIHRvb2xzIHNpZGUgdmFyaWFudCB3b3VsZCAoaW4gdGhlb3J5KSBhbGxvdyBmb3IgaW5qZWN0
aW9uCm9mIGEgcGVyLWhvc3QgdmFsdWUgb24gdGhlIHJlY2VpdmluZyBzaWRlLiBOb3Qgc3VyZSB3
aGV0aGVyIHRoaXMgaXMgYQpnb29kIGlkZWEsIHRob3VnaC4KCkFuZCBrbm93aW5nIHlvdSBhcmUg
dGFyZ2V0aW5nIGEgc3BlY2lhbCBjdXN0b21lciB5b3UgY291bGQgc3RpbGwgcmVwbGFjZQp0aGUg
bWlncmF0aW9uIHN0cmVhbSBzZW5kaW5nIHByb2dyYW0gdG8gaW5zZXJ0IHRoZSBqaXR0ZXIgdmFs
dWUuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
