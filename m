From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Fri, 23 Nov 2018 02:10:33 -0700
Message-ID: <5BF7C40902000078001FF3E4@prv1-mh.provo.novell.com>
References: <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <20181123085402.663pdh75rhqtxsf4@mac>
 <59739FBC020000C234861ACF@prv1-mh.provo.novell.com>
 <F553A58C020000AB0063616D@prv1-mh.provo.novell.com>
 <4D445A680200003E34861ACF@prv1-mh.provo.novell.com>
 <DAD49D5A020000780063616D@prv1-mh.provo.novell.com>
 <5400A6CB0200003634861ACF@prv1-mh.provo.novell.com>
 <203C1A92020000400063616D@prv1-mh.provo.novell.com>
 <0DF3BC62020000E934861ACF@prv1-mh.provo.novell.com>
 <C6A2E442020000640063616D@prv1-mh.provo.novell.com>
 <6EEA58AB020000EA34861ACF@prv1-mh.provo.novell.com>
 <A956719C020000150063616D@prv1-mh.provo.novell.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <A31948D30200007D0063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ7Tx-00084Q-KT
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 09:10:37 +0000
In-Reply-To: <A31948D30200007D0063616D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai Dontu <mdontu@bitdefender.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDA5OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTm92IDIyLCAyMDE4IGF0IDA4OjI0OjUyUE0gKzAyMDAsIFJhenZhbiBDb2pvY2Fy
dSB3cm90ZToKPj4gV2hhdCB0aGlzIHBhdGNoIGF0dGVtcHRzIHRvIGRvIGlzIHRvIG1hcmsgUDEg
cnd4IChzbyBhbGxvdyB0aGUgd3JpdGUpLAo+PiB0aGVuIHB1dCB0aGUgZmF1bHRpbmcgVkNQVSBp
bnRvIHNpbmdsZXN0ZXAgbW9kZSwgdGhlbiByZXN0b3JlIHRoZQo+PiByZXN0cmljdGlvbnMgYWZ0
ZXIgaXQgaGFzIGZpbmlzaGVkIHNpbmdsZSBzdGVwcGluZy4gQnkgbm93IGl0J3Mgb2J2aW91cwo+
PiB3aHkgYWxsIHRoZSBvdGhlciBWQ1BVcyBuZWVkIHRvIGJlIHBhdXNlZDogb25lIG9mIHRoZW0g
bWlnaHQgZG8gYQo+PiBtYWxpY2lvdXMgd3JpdGUgaW50byBQMSB0aGF0IHNpbGVudGx5IHN1Y2Nl
ZWRzIChzaW5jZSB0aGUgRVBUIGlzIHNoYXJlZAo+PiBhbW9uZyBhbGwgVkNQVXMgLSBwdXR0aW5n
IGFsdHAybSBhc2lkZSBmb3IgYSBtb21lbnQpLiBXZSBkb24ndCB3YW50IHRoYXQuCj4gCj4gQ2Fu
J3QgeW91IGp1c3QgY2hhbmdlIHRoZSBwMm0gb2YgYSBzaW5nbGUgdkNQVT8gRWl0aGVyIHVzaW5n
IGFsdHAybSBvcgo+IHNvbWUgb3RoZXIgbWVjaGFuaXNtLgoKSSBndWVzcyBhcyBhIHZlcnkgYmFz
aWMgbGltaXRhdGlvbiB0aGVyZSBhcmUgbm90IGVub3VnaCBkaXN0aW5jdAphbHRwMm0tcyBhdmFp
bGFibGUgdG8gdXNlIG9uZSBwZXIgdkNQVS4KCj4gQWxzbyBrZWVwIGluIG1pbmQgdGhhdCB0aGlz
IHBhdXNlIGFwcHJvYWNoIG1pZ2h0IHdvcmsgZm9yIGd1ZXN0cyB3aXRoCj4gYSByZWxhdGl2ZWx5
IHNtYWxsIG51bWJlciBvZiB2Q1BVcywgYnV0IEknbSB1bnN1cmUgdGhpcyBpcyBnb2luZyB0bwo+
IHdvcmsgZm9yIGd1ZXN0cyB3aXRoIGhpZ2ggbnVtYmVyIG9mIHZDUFVzLCBwYXVzaW5nIGFsbCB2
Q1BVcyBmb3IgZWFjaAo+IHRyYXBwZWQgaW5zdHJ1Y3Rpb24gaXMgbGlrZWx5IGdvaW5nIHRvIHN0
YWxsIHRoZSBndWVzdC4KCkluZGVlZC4gWWV0IGZvciBzbWFsbGVyIGd1ZXN0cyBhIHBlci12Q1BV
LWFsdHAybSBhcHByb2FjaCB3b3VsZApzZWVtIHRvIGJlIGZlYXNpYmxlIGF0IGxlYXN0IGZyb20g
YW4gYWJzdHJhY3QgcG92LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
