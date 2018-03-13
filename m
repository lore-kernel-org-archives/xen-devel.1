From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCHv3] xen: Add EFI_LOAD_OPTION support
Date: Tue, 13 Mar 2018 14:58:00 -0600
Message-ID: <CABfawhnXxLjvg6Lgqb88pVzknbU6KmyR8kMSK=wWicXjzy69NQ@mail.gmail.com>
References: <20180123002104.1674-1-tamas@tklengyel.com>
 <5A6B312C02000078001A2C0B@prv-mh.provo.novell.com>
 <CABfawhm5Rt-ChYoVHH1S5EnZBcVhb+66KpvV7TgUf27roXzdbw@mail.gmail.com>
 <5A6EF4DD02000078001A3406@prv-mh.provo.novell.com>
 <CABfawhmdX3LJcvZ0NX2FFXSsTCri+EenvV8OBZ-R9mEgfgOW8w@mail.gmail.com>
 <CABfawhnLVO4gHcahJW8EROUciOwc48NPihotJLNOwujw3ZHTmw@mail.gmail.com>
 <5AA7901502000078001B0CAB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvht=gd=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1evr0S-0008UG-9m
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 20:58:48 +0000
Received: by mail-wm0-f53.google.com with SMTP id 139so465501wmn.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 13:58:42 -0700 (PDT)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com.
 [74.125.82.51])
 by smtp.gmail.com with ESMTPSA id u46sm1119245edm.57.2018.03.13.13.58.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Mar 2018 13:58:41 -0700 (PDT)
Received: by mail-wm0-f51.google.com with SMTP id u10so254155wmu.4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 13:58:41 -0700 (PDT)
In-Reply-To: <5AA7901502000078001B0CAB@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMTo0NyBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPj4+PiBPbiAxMi4wMy4xOCBhdCAxNjowMCwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+IHdyb3RlOgo+PiBQYXRjaCBwaW5nLiBKYW4sIEkgd291bGQgbGlrZSB0byB0b3VjaCBi
YXNlIG9uY2UgbW9yZSB0byBzZWUgaWYgd2UgY2FuCj4+IGdldCB0aGlzIHBhdGNoIGluY2x1ZGVk
IGluIDQuMTEuIFRoZSBwYXRjaCBhcy1pcyBjb3JyZWN0bHkgdGVsbHMgdGhlCj4+IGRpZmZlcmVu
Y2UgYmV0d2VlbiBidWZmZXJzIHByb3ZpZGVkIGJ5IGJvdGggYW4gRUZJIHNoZWxsIG9yIGJ5IHRo
ZQo+PiBmaXJtd2FyZSBhcyBhbiBFRklfTE9BRF9PUFRJT04uCj4KPiBXZWxsLCBJJ3ZlIHN0YXRl
ZCBteSBvcGluaW9uIGJlZm9yZSwgYW5kIEknbSBpbnRlbmRpbmcgdG8gcHJvdmlkZSBhCj4gcmVw
bGFjZW1lbnQgcGF0Y2ggYWxvbmcgdGhlIG91dGxpbmUgSSBoYWQgcHJvdmlkZWQsIGJ1dCBJIGRp
ZG4ndCBnZXQKPiBhcm91bmQgdG8gYWN0dWFsbHkgZG8gc28geWV0Lgo+CgpUaGFua3MgZm9yIHRo
ZSB1cGRhdGUuIEkgd291bGQgYmUgaGFwcHkgdG8gd2FpdCBmb3IgeW91ciBwYXRjaCB0bwpyZWJh
c2UgdGhpcyBvbiB0b3Agb2YgaW4gc3RpbGwgbmVlZGVkLgoKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
