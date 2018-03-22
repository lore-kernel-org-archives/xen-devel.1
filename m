From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/7] xen/x86: use invpcid for flushing
 the TLB
Date: Thu, 22 Mar 2018 09:35:29 -0600
Message-ID: <5AB3DB5102000078001B5358@prv-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez2FZ-0002HF-84
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:35:33 +0000
In-Reply-To: <20180321125129.28539-5-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDEzOjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ICsrKyBiL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gQEAgLTEzODAsNiArMTM4MCwxNCBAQCBCZWNhdXNl
IHJlc3BvbnNpYmlsaXR5IGZvciBBUElDIHNldHVwIGlzIHNoYXJlZCBiZXR3ZWVuIFhlbiBhbmQg
dGhlCj4gIGRvbWFpbiAwIGtlcm5lbCB0aGlzIG9wdGlvbiBpcyBhdXRvbWF0aWNhbGx5IHByb3Bh
Z2F0ZWQgdG8gdGhlIGRvbWFpbgo+ICAwIGNvbW1hbmQgbGluZS4KPiAgCj4gKyMjIyBub2ludnBj
aWQgKHg4NikKPiArPiBgPSA8Ym9vbGVhbj5gCj4gKwo+ICtEaXNhYmxlIHVzaW5nIHRoZSBJTlZQ
Q0lEIGluc3RydWN0aW9uIGZvciBmbHVzaGluZyBUTEIgZW50cmllcy4KPiArVGhpcyBzaG91bGQg
b25seSBiZSB1c2VkIGluIGNhc2Ugb2Yga25vd24gaXNzdWVzIG9uIHRoZSBjdXJyZW50IHBsYXRm
b3JtCj4gK3dpdGggdGhhdCBpbnN0cnVjdGlvbi4gRGlzYWJsaW5nIElOVlBDSUQgd2lsbCBub3Jt
YWxseSByZXN1bHQgaW4gYSBzbGlnaHRseQo+ICtkZWdyYWRlZCBwZXJmb3JtYW5jZS4KCkF0IHRo
ZSBmaXJzdCBnbGFuY2UgdGhpcyBsb29rcyBhcyBpZiBpdCB3YW50cyB0byBiZSBhIGNwdWlkPQpz
dWItb3B0aW9uLiBIb3dldmVyLCB0aGF0IHdvdWxkIGRpc2FibGUgdXNlIGJ5IGJvdGggWGVuIGFu
ZAooSFZNKSBndWVzdHMuIEFuZHJldywgd2hhdCBhcmUgeW91ciBwbGFucyBoZXJlIGFzIHRvCmRp
c3Rpbmd1aXNoaW5nIHRoZSAiWGVuIHVzZXMgYSBmZWF0dXJlIiBmcm9tIHRoZSAiZGlzYWJsZSB1
c2Ugb2YKYSBmZWF0dXJlIGFsdG9nZXRoZXIiPwoKSWYgd2Ugc3RheSB3aXRoIGEgc2VwYXJhdGUg
b3B0aW9uLCB0aGVuIHBsZWFzZSBtYWtlIHRoaXMgYQpub3JtYWwgYm9vbGVhbiBvbmUgKGkuZS4g
ZHJvcCB0aGUgIm5vIiBwcmVmaXgpLCBhcyAibm8tbm9pbnZwY2lkIgppcyByYXRoZXIgdWdseS4K
Cj4gQEAgLTQ1Nyw3ICs0NzIsNiBAQCBzdGF0aWMgdm9pZCBnZW5lcmljX3NldF9hbGwodm9pZCkK
PiAgCQkJc2V0X2JpdChjb3VudCwgJnNtcF9jaGFuZ2VzX21hc2spOwo+ICAJCW1hc2sgPj49IDE7
Cj4gIAl9Cj4gLQkKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgZ2VuZXJpY19zZXRfbXRycih1bnNp
Z25lZCBpbnQgcmVnLCB1bnNpZ25lZCBsb25nIGJhc2UsCgpJIGRvbid0IG1pbmQgdGhpcyBsaW5l
IGJlaW5nIGRyb3BwZWQsIGJ1dCBpbiBnZW5lcmFsIHBsZWFzZSBhdm9pZApzdHJheSBjaGFuZ2Vz
IHdoaWNoIGFyZW4ndCBhc3NpbWlsYXRlZCBpbnRvIGNoYW5nZXMgeW91IGRvIGFueXdheS4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
