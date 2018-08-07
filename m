From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Tue, 7 Aug 2018 10:02:43 -0400
Message-ID: <a4f76a2a-128f-3e2a-44ee-04d57ab5be12__11161.7846684114$1533650429$gmane$org@oracle.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <2a9600b0-3b49-7835-a664-9deb30b100a4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x4l2=kw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fn2YZ-0003nr-KC
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 14:01:51 +0000
In-Reply-To: <2a9600b0-3b49-7835-a664-9deb30b100a4@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDcvMjAxOCAwOToxMSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMy8wNi8x
OCAxMTo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVXNpbmcgcHJpdmNtZF9jYWxsKCkgZm9y
IGEgc2luZ2xldG9uIG11bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9uZywgYXMKPj4gcHJpdmNtZF9j
YWxsKCkgaXMgdXNpbmcgc3RhYygpL2NsYWMoKSB0byBlbmFibGUgaHlwZXJ2aXNvciBhY2Nlc3Mg
dG8KPj4gTGludXggdXNlciBzcGFjZS4KPj4KPj4gQWRkIGEgbmV3IHhlbl9zaW5nbGVfY2FsbCgp
IGZ1bmN0aW9uIHRvIGJlIHVzZSBmb3IgdGhhdCBwdXJwb3NlLgo+Pgo+PiBSZXBvcnRlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQm9yaXMsIGFueSBvYmplY3Rpb25zPwoKCkkgdGhp
bmsgSmFuIHdhbnRlZCBhIGNoYW5nZSBpbiBjb21taXQgbWVzc2FnZS4gSSBjYW4gY29tbWl0IHdp
dGggdGhpczoKCiJVc2luZyBwcml2Y21kX2NhbGwoKSBmb3IgYSBzaW5nbGV0b24gbXVsdGljYWxs
IHNlZW1zIHRvIGJlIHdyb25nLCBhcwogcHJpdmNtZF9jYWxsKCkgaXMgdXNpbmcgc3RhYygpL2Ns
YWMoKSB0byBlbmFibGUgaHlwZXJ2aXNvciBhY2Nlc3MgdG8KIExpbnV4IHVzZXIgc3BhY2UuCgog
RXZlbiBpZiBjdXJyZW50bHkgbm90IGEgcHJvYmxlbSAocHYgZG9tYWlucyBjYW4ndCB1c2UgU01B
UCB3aGlsZSBIVk0KIGFuZCBQVkggZG9tYWlucyBjYW4ndCB1c2UgbXVsdGljYWxscykgdGhpbmdz
IG1pZ2h0IGNoYW5nZSB3aGVuCiBQVkggZG9tMCBzdXBwb3J0IGlzIGFkZGVkIHRvIHRoZSBrZXJu
ZWwuIgoKCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
