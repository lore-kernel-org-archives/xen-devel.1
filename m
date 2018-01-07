From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 15/22] vixen: pass through version
 hypercalls to parent Xen
Date: Sun, 7 Jan 2018 07:40:33 -0800
Message-ID: <CA+aC4kuBj-roLCVN0_+O7rRorM8CaYYDT2JMQwBit2_c2K74qA@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-16-git-send-email-aliguori@amzn.com>
 <20180107083123.judv4wjl7rhxc3gy@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYD4w-0000RN-9n
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:41:42 +0000
Received: by mail-lf0-f42.google.com with SMTP id f3so9716558lfe.4
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 07:41:35 -0800 (PST)
In-Reply-To: <20180107083123.judv4wjl7rhxc3gy@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCAxMjozMSBBTSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAyOjU0OjMw
UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogQW50aG9ueSBMaWd1b3Jp
IDxhbGlndW9yaUBhbWF6b24uY29tPgo+Pgo+PiBUaGlzIGlzIG5lY2Vzc2FyeSB0byB0cmlnZ2Vy
IGV2ZW50IGNoYW5uZWwgdXBjYWxscyBidXQgaXQgaXMgYWxzbwo+Cj4gSSdtIGxvc3QgaGVyZSwg
d2hhdCBkb2VzIHZlcnNpb24gaGF2ZSB0byBkbyB3aXRoIHVwY2FsbHM/CgpJbiBMaW51eCwgeGVu
X2ZvcmNlX2V2dGNobl9jYWxsYmFjaygpIGRvZXMgSFlQRVJWSVNPUl94ZW5fdmVyc2lvbigwLApO
VUxMKS4gIFRoaXMgaXMgZG9uZSB3aGVuIElSUXMgYXJlIHJlLWVuYWJsZWQgYWZ0ZXIgYmVpbmcg
ZGlzYWJsZWQgdG8KdHJpZ2dlciBjaGVja2luZyBwZW5kaW5nLgoKSSdtIG5vdCAxMDAlIGNvbmZp
ZGVudCB0aGF0IGl0J3MgbmVjZXNzYXJ5IHRvIHBhc3MgdGhpcyBhbGwgdGhlIHdheQp0aHJvdWdo
IHRvIHRoZSBwYXJlbnQgWGVuIGJ1dCBpdCBzZWVtZWQgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8Kc2luY2Ugd2UgbmVlZCB0aGUgcGFyZW50IHRvIHVwZGF0ZSBwZW5kaW5nIGV2ZW50cyBpbiBv
cmRlciBmb3IgdGhlCmV2ZW50cyBpbiBWaXhlbiB0byBnZXQgdXBkYXRlZC4KCj4+IHVzZWZ1bCB0
byBwYXNzdGhyb3VnaCB0aGUgZnVsbCB2ZXJzaW9uIGluZm9ybWF0aW9uIHN1Y2ggdGhhdCB0aGUK
Pj4gZ3Vlc3QgYmVsaWV2ZXMgaXQgaXMgcnVubmluZyBvbiB0aGUgcGFyZW50IFhlbi4KPgo+IElu
IGFueSBjYXNlLCBJIHRoaW5rIHRoaXMgaXMgd3JvbmcuIFRoZSBpbnRlcmZhY2UgdGhlIGd1ZXN0
IHNlZXMgaXMKPiB0aGUgaW50ZXJmYWNlIGZyb20gdml4ZW4sIG5vdCB0aGUgaW50ZXJmYWNlIG9m
IHRoZSBMMC4gSGVuY2UgcmVwb3J0aW5nCj4gdGhlIEwwIHZlcnNpb24gaXMgbm90IGFwcHJvcHJp
YXRlLgoKSSB0aGluayBpdCBkZXBlbmRzIG9uIHdoYXQgeW91IHdhbnQuICBXZSB3ZXJlIGFpbWlu
ZyBmb3IgbWF4aW11bQpjb21wYXRpYmlsaXR5IGFuZCBtYW55IHVzZXJzIHRyaWdnZXIgYmVoYXZp
b3IgZnJvbSBYZW4gdmVyc2lvbiBmb3IKYmV0dGVyIG9yIHdvcnNlLgoKSGFwcHkgdG8gbWFrZSB0
aGlzIG9wdGlvbmFsIGlmIHRoaXMgaXNuJ3QgdW5pdmVyc2FsbHkgZGVzaXJlZC4KClJlZ2FyZHMs
CgpBbnRob255IExpZ3VvcmkKCj4gVGhhbmtzLCBSb2dlci4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+
IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
