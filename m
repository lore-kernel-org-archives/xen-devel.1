From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH RFC 0/6] Slotted channels for sync vm_events
Date: Wed, 19 Dec 2018 15:33:05 -0700
Message-ID: <CABfawhmPgmta2LPyMraKK2eLAqcdPrjUyox4dCGZD1MRx8wJDQ@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UzuZ=O4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gZkPT-0007hO-QY
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 22:33:47 +0000
Received: by mail-ed1-f67.google.com with SMTP id b14so57340edt.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:33:46 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id w24-v6sm2972975eja.71.2018.12.19.14.33.42
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 14:33:43 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id r24so10559611wmh.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:33:42 -0800 (PST)
In-Reply-To: <cover.1545245243.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMTE6NTIgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGlzIGEgcmV3b3Jr
IG9mIHRoZSAibXVsdGktcGFnZSByaW5nIGJ1ZmZlciIgZm9yIHZtX2V2ZW50cwo+IHBhdGNoIGJh
c2VkIG9uIEFuZHJldyBDb29wZXIncyBjb21tZW50cy4KPiBGb3Igc3luY2hyb25vdXMgdm1fZXZl
bnRzIHRoZSByaW5nIHdhaXRxdWV1ZSBsb2dpYyB3YXMgdW5uZWNlc3NhcnkgYXMgdGhlCj4gdmNw
dSBzZW5kaW5nIHRoZSByZXF1ZXN0IHdhcyBibG9ja2VkIHVudGlsIGEgcmVzcG9uc2Ugd2FzIHJl
Y2VpdmVkLgo+IFRvIHNpbXBsaWZ5IHRoZSByZXF1ZXN0L3Jlc3BvbnNlIG1lY2hhbmlzbSwgYW4g
YXJyYXkgb2Ygc2xvdHRlZCBjaGFubmVscwo+IHdhcyBjcmVhdGVkLCBvbmUgcGVyIHZjcHUuIEVh
Y2ggdmNwdSBwdXRzIHRoZSByZXF1ZXN0IGluIHRoZQo+IGNvcnJlc3BvbmRpbmcgc2xvdCBhbmQg
YmxvY2tzIHVudGlsIHRoZSByZXNwb25zZSBpcyByZWNlaXZlZC4KPgo+IEknbSBzZW5kaW5nIHRo
aXMgcGF0Y2ggYXMgYSBSRkMgYmVjYXVzZSwgd2hpbGUgSSdtIHN0aWxsIHdvcmtpbmcgb24gd2F5
IHRvCj4gbWVhc3VyZSB0aGUgb3ZlcmFsbCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCwgeW91ciBm
ZWVkYmFjayB3b3VsZCBiZSBhIGdyZWF0Cj4gYXNzaXN0YW5jZS4KCkdlbmVyYWxseSBzcGVha2lu
ZyB0aGlzIGFwcHJvYWNoIGlzIE9LLCBidXQgSSdtIGNvbmNlcm5lZCB0aGF0IHdlIHdpbGwKZXZl
bnR1YWxseSBydW4gaW50byB0aGUgc2FtZSBwcm9ibGVtIHRoYXQgYnJvdWdodCB1cCB0aGUgaWRl
YSBvZiB1c2luZwptdWx0aS1wYWdlIHJpbmdzOiB2bV9ldmVudCBzdHJ1Y3R1cmVzIHRoYXQgYXJl
IGxhcmdlciB0aGVuIGEgcGFnZS4KUmlnaHQgbm93IHRoaXMgc2VyaWVzIGFkZHMgYSByaW5nIGZv
ciBlYWNoIHZDUFUsIHdoaWNoIGRvZXMgbWl0aWdhdGUKc29tZSBvZiB0aGUgYm90dGxlbmVjaywg
YnV0IGl0IGRvZXMgbm90IHJlYWxseSBhZGRyZXNzIHRoZSByb290IGNhdXNlLgpJdCBhbHNvIGFk
ZHMgc2lnbmlmaWNhbnQgY29tcGxleGl0eSBhcyB0aGUgdXNlcnNwYWNlIHNpZGUgbm93IGhhcyB0
bwptYXAgaW4gbXVsdGlwbGUgcmluZ3MsIGVhY2ggd2l0aCBpdHMgb3duIGV2ZW50IGNoYW5uZWwg
YW5kIHBvbGxpbmcKcmVxdWlyZW1lbnRzLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
