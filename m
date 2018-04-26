From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PULL v9 00/16] xen: xen-domid-restrict improvements
Date: Thu, 26 Apr 2018 18:36:54 +0100
Message-ID: <23266.3638.876146.489411@mariner.uk.xensource.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
 <CAFEAcA9cumr=t7mRZ-9KtLMWAK-9nVGmRsnXjJ+pc899ePxfVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBkpK-0007fy-8G
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 17:37:02 +0000
In-Reply-To: <CAFEAcA9cumr=t7mRZ-9KtLMWAK-9nVGmRsnXjJ+pc899ePxfVg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

UGV0ZXIgTWF5ZGVsbCB3cml0ZXMgKCJSZTogW1BVTEwgdjkgMDAvMTZdIHhlbjogeGVuLWRvbWlk
LXJlc3RyaWN0IGltcHJvdmVtZW50cyIpOgo+IEhpIC0tIG15IGFwcGx5LXB1bGxyZXEgc2NyaXB0
IHRoaW5rcyB0aGlzIGlzbid0IGEgc2lnbmVkIHRhZzoKPiAKPiBlcnJvcjogcmVtb3Rlcy9pd2ov
Zm9yLXVwc3RyZWFtLmRlcHJpdi0yOiBjYW5ub3QgdmVyaWZ5IGEgbm9uLXRhZyBvYmplY3Qgb2YK
PiB0eXBlIGNvbW1pdC4gRG9lcyBub3QgYXBwZWFyIHRvIGJlIGEgc2lnbmVkIHRhZwoKSXQgaXNu
J3QuICBJdCdzIG5vdCBhIHRhZyBhdCBhbGwuICBJdCdzIGEgYnJhbmNoLgoKPiBXZSBvbmx5IGFw
cGx5IHNpZ25lZC10YWcgcHVsbCByZXF1ZXN0cyB0aGVzZSBkYXlzOyBjb3VsZCB5b3UKPiBjcmVh
dGUgYW5kIHNpZ24gYSB0YWcgYW5kIHJlc2VuZCB0aGUgcHVsbHJlcSwgcGxlYXNlPyAoWW91Cj4g
b25seSBuZWVkIHRvIHJlc2VuZCB0aGUgY292ZXIgbGV0dGVyLCBub3QgdGhlIHdob2xlIHNldCBv
Zgo+IHBhdGNoZXMuKQoKSSBjYW4gZG8gdGhhdC4gIEFsdGVybmF0aXZlbHkgeW91IGNvdWxkIG1h
bnVhbGx5IHZlcmlmeSB0aGUgc2lnbmF0dXJlCm9uIG15IGVtYWlsIGFuZCBvYnNlcnZlIHRoYXQg
aXQgbWVudGlvbnMgdGhlIGNvcnJlY3QgY29tbWl0IGhhc2guCgo+IChodHRwczovL3dpa2kucWVt
dS5vcmcvQ29udHJpYnV0ZS9TdWJtaXRBUHVsbFJlcXVlc3QKPiBpcyBvdXIgcHJvY2VzcyBkb2N1
bWVudGF0aW9uIG9uIHB1bGwgcmVxdWVzdHMsIGJ1dCBJIHRoaW5rCj4gZXZlcnl0aGluZyBlbHNl
IHdpdGggdGhpcyBvbmUgaXMgZmluZS4pCgpJIHJlYWQgdGhhdC4gIEl0IGRvZXMgbm90IHNheSB0
aGF0IHRoZSBwdWxsIHJlcXVlc3QgbXVzdCByZWZlciB0byBhCnNpZ25lZCB0YWcuICBJdCBzYXlz
IHRoYXQgdGhlIHB1bGwgcmVxdWVzdCBtdXN0IGJlIHNpZ25lZCwgc28gSSBzaWduZWQKbXkgcHVs
bCByZXF1ZXN0IGJ5IGZlZWRpbmcgdGhlIGVtYWlsIGJvZHkgdG8gZ251cGcuCgpBIGRldGFpbGVk
IGV4cGxhbmF0aW9uIG9mIHdoeSB5b3Ugd2FudCB0aGUgcHVsbCByZXF1ZXN0IHRvIGJlIHNpZ25l
ZCwKcmF0aGVyIHRoYW4gZm9yIGl0IHRvIGJlIGFuIHVuc2lnbmVkIGVtYWlsIHJlZmVycmluZyB0
byBhIHNpZ25lZCB0YWcsCmlzIGJleW9uZCB0aGUgc2NvcGUgb2YgdGhpcyBtZW1vIDotKS4KCkFu
eXdheSwgd291bGQgeW91IGxpa2UgbWUgdG8gbWFrZSBhIHNpZ25lZCB0YWcgYW5kIHNlbmQgeW91
IGFuCnVuc2lnbmVkIGVtYWlsIHJlZmVycmluZyB0byBpdCwgdGhlbiA/ICBPciB3aWxsIHlvdSB1
c2UgdGhlIHNpZ25lZAplbWFpbCA/CgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
