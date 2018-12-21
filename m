From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 6/8] xen/arm: Implement workaround
 for Cortex-A76 erratum 1165522
Date: Fri, 21 Dec 2018 17:47:19 +0200
Message-ID: <81781506-4e3e-0a23-96cf-77a8f2daad7a@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-7-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaN1I-0000fk-9z
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 15:47:24 +0000
Received: by mail-lf1-x142.google.com with SMTP id b20so4197776lfa.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 07:47:22 -0800 (PST)
In-Reply-To: <20181128164939.8329-7-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEVhcmx5IHZlcnNpb24g
b2YgQ29ydGV4LUE3NiBjYW4gZW5kLXVwIHdpdGggY29ycnVwdCBUTEJzIGlmIHRoZXkKPiBzcGVj
dWxhdGUgYW4gQVQgaW5zdHJ1Y3Rpb24gd2hpbGUgdGhlIFMxL1MyIHN5c3RlbSByZWdpc3RlcnMg
YXJlIGluIGFuCj4gaW5jb25zaXN0ZW50IHN0YXRlLgo+IAo+IFRoaXMgY2FuIGhhcHBlbiBkdXJp
bmcgZ3Vlc3QgY29udGV4dCBzd2l0Y2ggYW5kIHdoZW4gaW52YWxpZGF0aW5nIHRoZQo+IFRMQnMg
Zm9yIG90aGVyIHRoYW4gdGhlIGN1cnJlbnQgVk1JRC4KPiAKPiBUaGUgd29ya2Fyb3VuZCBpbXBs
ZW1lbnRlZCBpbiBYZW4gd2lsbDoKPiAgICAgIC0gVXNlIGFuIGVtcHR5IHN0YWdlLTIgd2l0aCBh
IHJlc2VydmVkIFZNSUQgd2hpbGUgY29udGV4dCBzd2l0Y2hpbmcKPiAgICAgIGJldHdlZW4gMiBn
dWVzdHMKPiAgICAgIC0gVXNlIGFuIGVtcHR5IHN0YWdlLTIgd2l0aCB0aGUgVk1JRCB3aGVyZSBU
TEJzIG5lZWQgdG8gYmUgZmx1c2hlZAo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
