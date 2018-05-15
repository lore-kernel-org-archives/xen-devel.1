From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v3 4/6] ALSA: xen-front: Implement handling
 of shared buffers
Date: Tue, 15 May 2018 08:46:38 +0300
Message-ID: <e37b5170-4fab-0c06-8902-730e57118ceb__40538.7962972329$1526363146$gmane$org@gmail.com>
References: <20180514062742.25879-1-andr2000@gmail.com>
 <20180514062742.25879-5-andr2000@gmail.com> <s5ho9hi56ds.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om0z=ic=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fISnM-0005qA-ES
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 05:46:44 +0000
Received: by mail-lf0-x234.google.com with SMTP id r2-v6so21459393lff.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 May 2018 22:46:42 -0700 (PDT)
In-Reply-To: <s5ho9hi56ds.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
Cc: Juergen Gross <jgross@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTQvMjAxOCAxMToyOCBQTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIE1vbiwgMTQg
TWF5IDIwMTggMDg6Mjc6NDAgKzAyMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvc291bmQveGVuL3hlbl9zbmRfZnJvbnRfc2hidWYu
Ywo+PiBAQCAtMCwwICsxLDE5MyBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgT1IgTUlUCj4+ICsKPj4gKy8qCj4+ICsgKiBYZW4gcGFyYS12aXJ0dWFsIHNvdW5kIGRl
dmljZQo+PiArICoKPj4gKyAqIENvcHlyaWdodCAoQykgMjAxNi0yMDE4IEVQQU0gU3lzdGVtcyBJ
bmMuCj4+ICsgKgo+PiArICogQXV0aG9yOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgPHhl
bi94ZW4uaD4KPj4gKyNpbmNsdWRlIDx4ZW4veGVuYnVzLmg+Cj4+ICsKPj4gKyNpbmNsdWRlICJ4
ZW5fc25kX2Zyb250X3NoYnVmLmgiCj4gSG0sIHdpdGggdGhlIGxvY2FsIGJ1aWxkIHRlc3QsIEkg
Z2V0IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4KPiAgICBDQyBbTV0gIHNvdW5kL3hlbi94ZW5fc25k
X2Zyb250X3NoYnVmLm8KPiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gc291bmQveGVuL3hlbl9z
bmRfZnJvbnRfc2hidWYuYzoxMTowOgo+ICAgIC4vaW5jbHVkZS94ZW4veGVuLmg6MTg6ODogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmGJvb2zigJkKPiAgICAgZXh0ZXJuIGJvb2wgeGVuX3B2
aDsKPiAgICAgICAgICAgICBefn5+Cj4gICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1
ZGUveGVuL2ludGVyZmFjZS94ZW4uaDozMDowLAo+ICAgICAgICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL3hlbi94ZW4uaDoyOSwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIHNvdW5k
L3hlbi94ZW5fc25kX2Zyb250X3NoYnVmLmM6MTE6Cj4gICAgLi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS94ZW4vaW50ZXJmYWNlLmg6OTI6MjE6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50
NjRfdOKAmQo+ICAgICBERUZJTkVfR1VFU1RfSEFORExFKHVpbnQ2NF90KTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBeCj4gCQkJCj4gQWRkaW5nICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4g
Zml4ZWQgdGhlIGlzc3VlLgo+Cj4gRGlkIHlvdSByZWFsbHkgdGVzdCB5b3VyIHBhdGNoZXMgd2l0
aCB0aGUgbGF0ZXN0IExpbnVzIHRyZWU/Ck15IGJhZCwgaXQgZG9lcyBidWlsZCBmb3IgQVJNICh3
aGljaCBpcyBteSB0YXJnZXQpLCBidXQgYWxzbyBkb2VzCm5lZWQgIiNpbmNsdWRlIDxsaW51eC9r
ZXJuZWwuaD4iIGZvciB4ODYgd2hpY2ggSSBkaWRuJ3QgYnVpbGQgdGhpcyB0aW1lLgpTb3JyeSBh
Ym91dCB0aGF0LgoKRG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIHRoaXMgc2luZ2xlIHBhdGNoIG9y
IHlvdSBjYW4gbWFrZSB0aGUgY2hhbmdlCndoaWxlIGFwcGx5aW5nPwo+Cj4KPiB0aGFua3MsCj4K
PiBUYWthc2hpClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
