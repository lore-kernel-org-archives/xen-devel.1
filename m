From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v1] xen: acpi: upload _PSD info for offline
	CPUs too
Date: Wed, 7 Mar 2018 12:51:12 -0500
Message-ID: <a62621c6-ca44-fae4-7661-b7fe5380bbc0__8696.76345396346$1520444936$gmane$org@oracle.com>
References: <20180306201209.21890-1-joao.m.martins@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cjrx=f5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1etdCH-0001o6-MJ
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 17:49:49 +0000
In-Reply-To: <20180306201209.21890-1-joao.m.martins@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDYvMjAxOCAwMzoxMiBQTSwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+IEFsbCB1cGxvYWRl
ZCBQTSBkYXRhIGZyb20gb2ZmbGluZSBDUFVzIHRha2VzIHRoZSBpbmZvIGZyb20gdkNQVSAwIGFu
ZAoKIm9mZmxpbmUiIG1heSBub3QgYmUgdGhlIHJpZ2h0IHRlcm0gaGVyZS4gTWF5YmUgIm5vbi1k
b20wIj8KCj4gY2hhbmdpbmcgb25seSB0aGUgYWNwaV9pZC4gRm9yIHByb2Nlc3NvcnMgd2hpY2gg
UC1zdGF0ZSBjb29yZGluYXRpb24gdHlwZQo+IGlzIEhXX0FMTCAoMHhGRCkgaXQgaXMgT0sgdG8g
dXBsb2FkIGJvZ3VzIFAtc3RhdGUgZGVwZW5kZW5jeSBpbmZvcm1hdGlvbgo+IChfUFNEKSwgYmVj
YXVzZSBYZW4gd2lsbCBpZ25vcmUgY3B1ZnJlcSBkb21haW5zIGV4aXN0ZW5jZS4KPgo+IEFsYmVp
dCBmb3IgaGFyZHdhcmUgZXhwb3NpbmcgUHggY29vcmRpbmF0aW9uIHR5cGVzIGFzIFNXX0FOWSBv
ciBTV19BTEwsCj4gdGhpcyB3aWxsIGhhdmUgc29tZSB1bmludGVuZGVkIHNpZGUgZWZmZWN0cy4g
RWZmZWN0aXZlbHksIGl0IHdpbGwgbG9vayBhdAo+IHRoZSBQLXN0YXRlIGRvbWFpbiBleGlzdGVu
Y2UgYW5kICppZiBpdCBhbHJlYWR5IGV4aXN0cyogaXQgd2lsbCBza2lwIHRoZQo+IGFjcGktY3B1
ZnJlcSBpbml0aWFsaXphdGlvbiBhbmQgdGh1cyBpbmhlcml0IHRoZSBwb2xpY3kgZnJvbSB0aGUg
Zmlyc3QgQ1BVCj4gaW4gdGhlIGNwdWZyZXEgZG9tYWluLiBUaGlzIHdpbGwgZmluYWxseSBsZWFk
IHRvIHRoZSBvcmlnaW5hbCBjcHUgbm90Cj4gY2hhbmdpbmcgdGFyZ2V0IGZyZXEgdG8gUDAgb3Ro
ZXIgdGhhbiB0aGUgZmlyc3QgaW4gdGhlIGRvbWFpbi4gV2hpY2ggd2lsbAo+IG1ha2UgdHVyYm8g
Ym9vc3Qgbm90IGdldHRpbmcgZW5hYmxlZCAoZS5nLiBmb3IgJ3BlcmZvcm1hbmNlJyBnb3Zlcm5v
cikgZm9yCj4gYWxsIGNwdXMuCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRoYXQsIGJ5IGFsc28gZXZh
bHVhdGluZyBfUFNEIHdoZW4gZW51bWVyYXRpbmcgYWxsIEFDUEkKPiBwcm9jZXNvcnMgKG9ubGlu
ZSBhbmQgb2ZmbGluZSkgYW5kIGFsd2F5cyB1cGxvYWRpbmcgdGhlIGNvcnJlY3QgUC1TdGF0ZQo+
IGRlcGVuZGVuY3kgdXAgdG8gWGVuLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9hbyBNYXJ0aW5zIDxq
b2FvLm0ubWFydGluc0BvcmFjbGUuY29tPgo+IC0tLQo+IHhlbl9wcm9jZXNzb3JfZ2V0X3BzZCgp
IGlzIHRha2VuIGZyb20gYWNwaV9wcm9jZXNzb3JfZ2V0X3BzZCgpCj4gKGRyaXZlcnMvYWNwaS9w
cm9jZXNzb3JfcGVyZmxpYi5jKSBzaW1wbHkgYmVjYXVzZSBvbmx5IFhlbiBEb20wIG5lZWRzCj4g
dG8gaGFuZGxlIHZjcHVzICE9IHBjcHVzLiBJZiBwcmVmZXJyZWQgSSBjb3VsZCB0cnkgZXhwb3J0
aW5nIHRoYXQgQVBJCj4gaW5zdGVhZCBhbmQgdXNlIGl0IGhlcmUuCgpJIHRoaW5rIHRoaXMgd291
bGQgYmUgYSBwcmVmZXJhYmxlIGFwcHJvYWNoLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
