From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Tue, 10 Apr 2018 03:00:58 -0600
Message-ID: <5ACC996A02000078001B9CE9@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5p9E-0004V5-O8
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:01:04 +0000
In-Reply-To: <20180410075843.6822-2-jgross@suse.com>
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

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBGb3Ig
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
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCj4gLS0tCj4gVjY6Cj4gLSBjb3JyZWN0IGFuIGVycm9yIGZyb20gcmViYXNp
bmcgdG8gc3RhZ2luZyBpbiBhc3NlbWJseSBwYXJ0CgpJIGhhdmUgdG8gYWRtaXQgdGhhdCB3aXRo
b3V0IGRpZ2dpbmcgb3V0IHY1IEkgY2FuJ3Qgc3BvdCB0aGUKY2hhbmdlLgoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
