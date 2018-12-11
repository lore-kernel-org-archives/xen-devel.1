From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Tue, 11 Dec 2018 10:01:11 -0700
Message-ID: <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWlPL-0007XU-6x
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 17:01:19 +0000
In-Reply-To: <1543383256-12371-7-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDA2OjM0LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBU
aGlzIHBhdGNoIHBvcnRzIG1pY3JvY29kZSBpbXByb3ZlbWVudCBwYXRjaGVzIGZyb20gbGludXgg
a2VybmVsLgo+IAo+IEJlZm9yZSB5b3UgcmVhZCBhbnkgZnVydGhlcjogdGhlIGVhcmx5IGxvYWRp
bmcgbWV0aG9kIGlzIHN0aWxsIHRoZQo+IHByZWZlcnJlZCBvbmUgYW5kIHlvdSBzaG91bGQgYWx3
YXlzIGRvIHRoYXQuIFRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMKPiBpbXByb3ZpbmcgdGhlIGxhdGUg
bG9hZGluZyBtZWNoYW5pc20gZm9yIGxvbmcgcnVubmluZyBqb2JzIGFuZCBjbG91ZCB1c2UKPiBj
YXNlcy4KPiAKPiBHYXRoZXIgYWxsIGNvcmVzIGFuZCBzZXJpYWxpemUgdGhlIG1pY3JvY29kZSB1
cGRhdGUgb24gdGhlbSBieSBkb2luZyBpdAo+IG9uZS1ieS1vbmUgdG8gbWFrZSB0aGUgbGF0ZSB1
cGRhdGUgcHJvY2VzcyBhcyByZWxpYWJsZSBhcyBwb3NzaWJsZSBhbmQKPiBhdm9pZCBwb3RlbnRp
YWwgaXNzdWVzIGNhdXNlZCBieSB0aGUgbWljcm9jb2RlIHVwZGF0ZS4KClNvIHlvdSBzdGlsbCBk
aWRuJ3Qgc3dpdGNoIHRvIHByb2Nlc3MgY29yZXMgb3IgYXQgdGhlIHZlcnkgbGVhc3QKc29ja2V0
cyBpbiBwYXJhbGxlbD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
