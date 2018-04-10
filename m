From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 4/9] xen/x86: use invpcid for flushing
 the TLB
Date: Tue, 10 Apr 2018 03:15:22 -0600
Message-ID: <5ACC9CCA02000078001B9D34@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5pNA-0005k7-FM
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:15:28 +0000
In-Reply-To: <20180410075843.6822-5-jgross@suse.com>
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJZiBw
b3NzaWJsZSB1c2UgdGhlIElOVlBDSUQgaW5zdHJ1Y3Rpb24gZm9yIGZsdXNoaW5nIHRoZSBUTEIg
aW5zdGVhZCBvZgo+IHRvZ2dsaW5nIGNyNC5wZ2UgZm9yIHRoYXQgcHVycG9zZS4KPiAKPiBXaGls
ZSBhdCBpdCByZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gY3I0LnBnZSBiZWluZyByZXF1aXJlZCBm
b3IgbXRycgo+IGxvYWRpbmcsIGFzIHRoaXMgd2lsbCBiZSByZXF1aXJlZCBsYXRlciBhbnl3YXku
Cj4gCj4gQWRkIGEgY29tbWFuZCBsaW5lIG9wdGlvbiAiaW52cGNpZCIgZm9yIGNvbnRyb2xsaW5n
IHRoZSB1c2Ugb2YKPiBJTlZQQ0lEIChkZWZhdWx0IHRvIHRydWUpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
