From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 1/3] xen: Sync up with the canonical
 protocol definitions in Xen
Date: Tue, 12 Jun 2018 16:40:20 -0700
Message-ID: <20180612234020.GI38773__6177.21727253429$1528846780$gmane$org@dtor-ws>
References: <20180612074856.28451-1-andr2000@gmail.com>
 <20180612074856.28451-2-andr2000@gmail.com>
 <9c579567-ebe2-f465-5443-b3a3e71d34a5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zo66=i6=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1fSstl-00040u-QF
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 23:40:25 +0000
Received: by mail-pl0-x243.google.com with SMTP id w17-v6so377479pll.9
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 16:40:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <9c579567-ebe2-f465-5443-b3a3e71d34a5@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDM6NDY6MTBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxMi8wNi8xOCAwOTo0OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4gPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+Cj4gPiAKPiA+IFRoaXMgaXMgdGhlIHN5bmMgdXAgd2l0aCB0aGUgY2Fub25p
Y2FsIGRlZmluaXRpb25zIG9mIHRoZSBpbnB1dCwKPiA+IHNvdW5kIGFuZCBkaXNwbGF5IHByb3Rv
Y29scyBpbiBYZW4uCj4gPiAKPiA+IENoYW5nZXMgdG8ga2JkaWY6Cj4gPiAxLiBBZGQgbWlzc2lu
ZyBzdHJpbmcgY29uc3RhbnRzIGZvciB7ZmVhdHVyZXxyZXF1ZXN0fS1yYXctcG9pbnRlcgo+ID4g
ICAgdG8gYWxpZ24gd2l0aCB0aGUgcmVzdCBvZiB0aGUgaW50ZXJmYWNlIGZpbGUuCj4gPiAKPiA+
IDIuIEFkZCBuZXcgWGVuU3RvcmUgZmVhdHVyZSBmaWVsZHMsIHNvIGl0IGlzIHBvc3NpYmxlIHRv
IGluZGl2aWR1YWxseQo+ID4gICAgY29udHJvbCBzZXQgb2YgZXhwb3NlZCB2aXJ0dWFsIGRldmlj
ZXMgZm9yIGVhY2ggZ3Vlc3QgT1M6Cj4gPiAgICAgIC0gc2V0IGZlYXR1cmUtZGlzYWJsZS1rZXli
b2FyZCB0byAxIGlmIG5vIGtleWJvYXJkIGRldmljZSBuZWVkcwo+ID4gICAgICAgIHRvIGJlIGNy
ZWF0ZWQKPiA+ICAgICAgLSBzZXQgZmVhdHVyZS1kaXNhYmxlLXBvaW50ZXIgdG8gMSBpZiBubyBw
b2ludGVyIGRldmljZSBuZWVkcwo+ID4gICAgICAgIHRvIGJlIGNyZWF0ZWQKPiA+IAo+ID4gMy4g
TW92ZSBtdWx0aS10b3VjaCBkZXZpY2UgcGFyYW1ldGVycyB0byBiYWNrZW5kIG5vZGVzOiB0aGVz
ZSBhcmUKPiA+ICAgICBkZXNjcmliZWQgYXMgYSBwYXJ0IG9mIGZyb250ZW5kJ3MgWGVuQnVzIGNv
bmZpZ3VyYXRpb24gbm9kZXMKPiA+ICAgICB3aGlsZSB0aGV5IGJlbG9uZyB0byBiYWNrZW5kJ3Mg
Y29uZmlndXJhdGlvbi4gRml4IHRoaXMgYnkgbW92aW5nCj4gPiAgICAgdGhlIHBhcmFtZXRlcnMg
dG8gdGhlIHByb3BlciBzZWN0aW9uLgo+ID4gCj4gPiBVbmlxdWUtaWQgZmllbGQ6Cj4gPiAxLiBB
ZGQgdW5pcXVlLWlkIFhlbkJ1cyBlbnRyeSBmb3IgdmlydHVhbCBpbnB1dCBhbmQgZGlzcGxheS4K
PiA+IAo+ID4gMi4gQ2hhbmdlIHR5cGUgb2YgdW5pcXVlLWlkIGZpZWxkIHRvIHN0cmluZyBmb3Ig
c25kaWYgdG8gYWxpZ24gd2l0aAo+ID4gZGlzcGxheSBhbmQgaW5wdXQgcHJvdG9jb2xzLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gCj4gSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIGJlaW5nIGFkZGVkIHZp
YSB0aGUgaW5wdXQgdHJlZSB3aXRoIHRoZSBvdGhlcgo+IHBhdGNoZXMuIEluIGNhc2UgSSBzaG91
bGQgdGFrZSBpdCB2aWEgdGhlIFhlbiB0cmVlLCBwbGVhc2Ugc2VuZCBtZSBhCj4gbm90ZS4KCkp1
ZXJnZW4sCgpJIGNyZWF0ZWQgYW4gaW1tdXRhYmxlIGJyYW5jaCBvZmYgdjQuMTcgd2l0aCB0aGVz
ZSAzIHBhdGNoZXMgaW4gY2FzZSB5b3UKd291bGQgd2FudCB0byBtZXJnZSB0aGVtIGludG8geW91
ciB0cmVlIHdpdGhvdXQgd2FpdGluZyBmb3IgdGhlbSB0bwphcHBlYXIgaW4gbWFpbmxpbmU6Cgpn
aXQgcHVsbCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZHRv
ci9pbnB1dC5naXQgaWIvNC4xNy14ZW4ta2JkZnJvbnQtcnVudGltZS1jb25maWcKClRoYW5rcy4K
Ci0tIApEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
