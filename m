From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/7] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Wed, 28 Mar 2018 07:45:07 -0600
Message-ID: <5ABBB88302000078001B6D09@prv1-mh.provo.novell.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nfe5=gs=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1BO4-0006rv-NM
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 13:45:12 +0000
In-Reply-To: <20180327090704.28646-2-jgross@suse.com>
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

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBGb3Ig
bWl0aWdhdGlvbiBvZiBNZWx0ZG93biB0aGUgY3VycmVudCBMNCBwYWdlIHRhYmxlIGlzIGNvcGll
ZCB0byB0aGUKPiBjcHUgbG9jYWwgcm9vdCBwYWdlIHRhYmxlIGVhY2ggdGltZSBhIDY0IGJpdCBw
diBndWVzdCBpcyBlbnRlcmVkLgo+IAo+IENvcHlpbmcgY2FuIGJlIGF2b2lkZWQgaW4gY2FzZXMg
d2hlcmUgdGhlIGd1ZXN0IEw0IHBhZ2UgdGFibGUgaGFzbid0Cj4gYmVlbiBtb2RpZmllZCB3aGls
ZSBydW5uaW5nIHRoZSBoeXBlcnZpc29yLCBlLmcuIHdoZW4gaGFuZGxpbmcKPiBpbnRlcnJ1cHRz
IG9yIGFueSBoeXBlcmNhbGwgbm90IG1vZGlmeWluZyB0aGUgTDQgcGFnZSB0YWJsZSBvciAlY3Iz
Lgo+IAo+IFNvIGFkZCBhIHBlci1jcHUgZmxhZyB3aGV0aGVyIHRoZSBjb3B5aW5nIHNob3VsZCBi
ZSBwZXJmb3JtZWQgYW5kIHNldAo+IHRoYXQgZmxhZyBvbmx5IHdoZW4gbG9hZGluZyBhIG5ldyAl
Y3IzIG9yIG1vZGlmeWluZyB0aGUgTDQgcGFnZSB0YWJsZS4KPiBUaGlzIGluY2x1ZGVzIHN5bmNo
cm9uaXphdGlvbiBvZiB0aGUgY3B1IGxvY2FsIHJvb3QgcGFnZSB0YWJsZSB3aXRoCj4gb3RoZXIg
Y3B1cywgc28gYWRkIGEgc3BlY2lhbCBzeW5jaHJvbml6YXRpb24gZmxhZyBmb3IgdGhhdCBjYXNl
Lgo+IAo+IEEgc2ltcGxlIHBlcmZvcm1hbmNlIGNoZWNrIChjb21waWxpbmcgdGhlIGh5cGVydmlz
b3IgdmlhICJtYWtlIC1qIDQiKQo+IGluIGRvbTAgd2l0aCA0IHZjcHVzIHNob3dzIGEgc2lnbmlm
aWNhbnQgaW1wcm92ZW1lbnQ6Cj4gCj4gLSByZWFsIHRpbWUgZHJvcHMgZnJvbSAxMTIgc2Vjb25k
cyB0byAxMDMgc2Vjb25kcwo+IC0gc3lzdGVtIHRpbWUgZHJvcHMgZnJvbSAxNDIgc2Vjb25kcyB0
byAxMzEgc2Vjb25kcwo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
