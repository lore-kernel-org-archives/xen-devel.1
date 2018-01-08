From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 08/23] vixen: allow dom0 to be created
 with a domid != 0
Date: Mon, 8 Jan 2018 14:55:50 +0000
Message-ID: <20180108145550.rpf6po7kdc7eqmxj@citrix.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-9-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYYq9-00019R-V0
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 14:55:53 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-9-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjRQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBTb21lIG9sZGVyIGd1ZXN0cyBzcGVjaWFsIGNhc2UgZG9taWQ9MCBpbnN0ZWFkIG9mIGNoZWNr
aW5nIHRoZQo+IHNoYXJlZCBpbmZvIGZsYWdzIHNvIGluIG9yZGVyIHRvIGdldCBQViBkcml2ZXJz
IGxvYWRlZCBwcm9wZXJseSwKPiB3ZSBuZWVkIHRvIG1ha2UgdGhlIGd1ZXN0IGFsd2F5cyBhcHBl
YXIgd2l0aCBhIGRvbWlkICE9IDAuCj4gCj4gV2hpbGUgdGhlIFZpeGVuIGRvbWFpbiBpcyB0aGUg
aGFyZHdhcmUgZG9tYWluLCB3ZSBkb24ndCB3YW50IGl0Cj4gdG8gYmVoYXZlIHRoYXQgd2F5IHNv
IHdlIGFsc28gbW9kaWZ5IHRoZSBpc19oYXJkd2FyZV9kb21haW4oKQo+IGNoZWNrLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAtLS0K
PiB2MSAtPiB2Mgo+ICAtIGFsbG93IHZpeGVuIGRvbWFpbiBpZCB0byBiZSBvdmVycmlkZGVuIHZp
YSB0aGUgWGVuIGNvbW1hbmQgbGluZQoKVGhpcyBwYXRjaCB3aWxsIGNhbiBiZSBicm9rZW4gdXAg
aW50byB0d286CgoxLiBBIHBhdGNoIHRoYXQgbW9kaWZpZXMgaXNfaGFyZHdhcmVfZG9tYWluLgoy
LiBBIHBhdGNoIHRoYXQgYWRkcyB0aGUgZG9taWQgY29tbWFuZCBsaW5lIG9wdGlvbi4KCkJ1dCBJ
IHRoaW5rIHRoZSBmaXJzdCBwYXRjaCBpcyBub3QgcmVxdWlyZWQgYmVjYXVzZSB0aGUgcHYtaW4t
cHZoIHNoaW0Kd29ya3MgZmluZSBldmVuIGlmIHRoZSBndWVzdCBpcyBub3QgaGFyZHdhcmUgZG9t
YWluLgoKUGxlYXNlIGRvbid0IGRvIGFueSByZWFsIHdvcmsgeWV0IC0tIHdlIG5lZWQgdG8gYWdy
ZWUgb24gdGhlIHRoaW5ncwppbiB0aGUgbXkgcmVwbHkgdG8gdGhlIGNvdmVyIGxldHRlciBmaXJz
dC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
