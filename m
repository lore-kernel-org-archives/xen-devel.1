From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 18:22:31 +0000
Message-ID: <45846223-e941-d8f2-a719-1f50d89ce4b3@citrix.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <5A6F5F0002000078001A37EE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ldhx=ey=citrix.com=prvs=560163be1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1egE4l-00084P-ME
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 18:22:39 +0000
In-Reply-To: <5A6F5F0002000078001A37EE@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, IanJackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDEvMTggMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjAxLjE4IGF0
IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBDbGFuZyBhc3NlbWJsZXIg
ZG9lc24ndCBzdXBwb3J0IHVzaW5nIC5za2lwIHdpdGggbm9uLWFic29sdXRlCj4+IGV4cHJlc3Np
b25zOgo+Pgo+PiBlbnRyeS5TOjEwOToxNTogZXJyb3I6IGV4cGVjdGVkIGFic29sdXRlIGV4cHJl
c3Npb24KPj4gICAgICAgICAuc2tpcCAuTGNyNF9hbHRfZW5kIC0gLkxjcjRfYWx0LCAweDkwCj4+
ICAgICAgICAgICAgICAgXgo+Pgo+PiBUaGlzIHVzYWdlIG9mIC5za2lwIHdhcyB0byBmaWxsIGNv
ZGUgc2VjdGlvbnMgd2l0aCBOT1BzIGluIG9yZGVyIGZvcgo+PiB0aGVtIHRvIGJlIHBhdGNoZWQg
YXQgcnVuIHRpbWUgaWYgcmVxdWlyZWQgYnkgdGhlIGFsdGVybmF0aXZlcwo+PiBmcmFtZXdvcmsu
IEluc3RlYWQgb2YgdXNpbmcgLnNraXAgdXNlIHRoZSBhcHByb3ByaWF0ZSBudW1iZXIgb2YgTk9Q
cwo+PiB0byBtYXRjaCB0aGUgc2l6ZSBvZiB0aGUgYWx0ZXJuYXRpdmUgY29kZS4KPiBOQUsgLSBJ
J3ZlIHZvaWNlZCBhIG51bWJlciBvZiB0aW1lcyBteSBvcHBvc2l0aW9uIHRvIEFuZHJldyBhZGRp
bmcKPiB0aGUgdmFyaW91cyBBU01fTk9QPE4+IGluIGhpcyBTcGVjdHJlIHYyIHNlcmllcywgYW5k
IEknbSBwbGFubmluZwo+IHRvIGVsaW1pbmF0ZSB0aGVtIGluIGR1ZSBjb3Vyc2UgKGJ5IHVzaW5n
IC0geW91IGd1ZXNzIGl0IC0gLnNraXApLiBJdAo+IGlzIHByZXR0eSBtdWNoIHVuYWNjZXB0YWJs
ZSB0byBtZSB0byBoYXZlIHRvIGVuY29kZSB0aGUgc2l6ZSBvZgo+IGNlcnRhaW4gaW5zdHJ1Y3Rp
b25zIGluIGEgc2Vjb25kIHBsYWNlLCByaXNraW5nIHRoZW0gdG8gZ28gb3V0IG9mIHN5bmMKPiB3
aXRoIHdoYXQgdGhleSBzaGFkb3cuCgpBbmQgRlRSLCB0aGUgU3BlY3RyZSB2MiBzZXJpZXMgZXhw
bGljaXQgc2l6ZXMgd2VyZSBvbmx5IGJlY2F1c2UgSSB0cmllZApmaXhpbmcgWGVuJ3MgYWJpbGl0
eSB0byBkbyBzZW5zaWJsZSB0aGluZ3Mgd2l0aCBub3BzIGluIGFsdGVybmF0aXZlLCBidXQKZ290
IGZhciB0b28gYm9nZ2VkIGRvd24gYW5kIGRlY2lkZWQgdGhhdCB0aGUgU3BlY3RyZSB3b3JrIHdh
cyBtb3JlCmltcG9ydGFudC4KCkkgd2lsbCBiZSBkdXN0aW5nIHRoZSBzZXJpZXMgb2ZmIGluIGR1
ZSBjb3Vyc2UgYW5kIHJlbW92aW5nIHRoZSBleHBsaWNpdApzaXplcy4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
