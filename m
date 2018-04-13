From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Fri, 13 Apr 2018 02:43:15 -0600
Message-ID: <5AD06DA302000078001BAFB0@prv1-mh.provo.novell.com>
References: <20180412180944.31735-1-jgross@suse.com>
 <20180412180944.31735-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gr51=hc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6uIe-0001RP-MF
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 08:43:16 +0000
In-Reply-To: <20180412180944.31735-2-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA0LjE4IGF0IDIwOjA5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBGb3Ig
bWl0aWdhdGlvbiBvZiBNZWx0ZG93biB0aGUgY3VycmVudCBMNCBwYWdlIHRhYmxlIGlzIGNvcGll
ZCB0byB0aGUKPiBjcHUgbG9jYWwgcm9vdCBwYWdlIHRhYmxlIGVhY2ggdGltZSBhIDY0IGJpdCBw
diBndWVzdCBpcyBlbnRlcmVkLgo+IAo+IENvcHlpbmcgY2FuIGJlIGF2b2lkZWQgaW4gY2FzZXMg
d2hlcmUgdGhlIGd1ZXN0IEw0IHBhZ2UgdGFibGUgaGFzbid0Cj4gYmVlbiBtb2RpZmllZCB3aGls
ZSBydW5uaW5nIHRoZSBoeXBlcnZpc29yLCBlLmcuIHdoZW4gaGFuZGxpbmcKPiBpbnRlcnJ1cHRz
IG9yIGFueSBoeXBlcmNhbGwgbm90IG1vZGlmeWluZyB0aGUgTDQgcGFnZSB0YWJsZSBvciAlY3Iz
Lgo+IAo+IFNvIGFkZCBhIHBlci1jcHUgZmxhZyBpbmRpY2F0aW5nIHdoZXRoZXIgdGhlIGNvcHlp
bmcgc2hvdWxkIGJlCj4gcGVyZm9ybWVkIGFuZCBzZXQgdGhhdCBmbGFnIG9ubHkgd2hlbiBsb2Fk
aW5nIGEgbmV3ICVjcjMgb3IgbW9kaWZ5aW5nCj4gdGhlIEw0IHBhZ2UgdGFibGUuICBUaGlzIGlu
Y2x1ZGVzIHN5bmNocm9uaXphdGlvbiBvZiB0aGUgY3B1IGxvY2FsCj4gcm9vdCBwYWdlIHRhYmxl
IHdpdGggb3RoZXIgY3B1cywgc28gYWRkIGEgc3BlY2lhbCBzeW5jaHJvbml6YXRpb24gZmxhZwo+
IGZvciB0aGF0IGNhc2UuCj4gCj4gQSBzaW1wbGUgcGVyZm9ybWFuY2UgY2hlY2sgKGNvbXBpbGlu
ZyB0aGUgaHlwZXJ2aXNvciB2aWEgIm1ha2UgLWogNCIpCj4gaW4gZG9tMCB3aXRoIDQgdmNwdXMg
c2hvd3MgYSBzaWduaWZpY2FudCBpbXByb3ZlbWVudDoKPiAKPiAtIHJlYWwgdGltZSBkcm9wcyBm
cm9tIDExMiBzZWNvbmRzIHRvIDEwMyBzZWNvbmRzCj4gLSBzeXN0ZW0gdGltZSBkcm9wcyBmcm9t
IDE0MiBzZWNvbmRzIHRvIDEzMSBzZWNvbmRzCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gLS0tCj4gVjc6Cj4gLSBhZGQgbWlzc2luZyBmbGFnIHNldHRpbmcgaW4g
c2hhZG93IGNvZGUKClRoaXMgbm93IG5lZWRzIGFuIGFjayBmcm9tIFRpbSAobm93IENjLWVkKS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
