From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [RFC PATCH 2/6] tools/libxc: Define VM_EVENT type
Date: Wed, 19 Dec 2018 15:13:16 -0700
Message-ID: <CABfawh=Ra+_XKe36JK96UHqi8JFN0zgFhEGMABfR+DNt+BZ1ww@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UzuZ=O4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gZk6J-0005ol-9V
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 22:13:59 +0000
Received: by mail-ed1-f68.google.com with SMTP id b14so21357edt.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:13:57 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id g37sm5884222edb.85.2018.12.19.14.13.54
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 14:13:55 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id s12so20666597wrt.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:13:54 -0800 (PST)
In-Reply-To: <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMTE6NTIgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBEZWZpbmUgdGhlIHR5cGUgZm9yIGVhY2gg
b2YgdGhlIHN1cHBvcnRlZCB2bV9ldmVudCByaW5ncyAocGFnaW5nLAo+IG1vbml0b3IgYW5kIHNo
YXJpbmcpIGFuZCByZXBsYWNlIHRoZSByaW5nIHBhcmFtIGZpZWxkIHdpdGggdGhpcyB0eXBlLgo+
Cj4gUmVwbGFjZSBYRU5fRE9NQ1RMX1ZNX0VWRU5UX09QXyBvY2N1cnJlbmNlcyB3aXRoIHRoZWly
IGNvcnJlc3BvbmRpbmcKPiBYRU5fVk1fRVZFTlRfVFlQRV8gY291bnRlcnBhcnQuCj4KClRoaXMg
cGF0Y2ggbG9va3MgZmluZSB0byBtZSBhcy1pcywgbW9zdGx5IGp1c3QgbWVjaGFuaWNhbCByZW5h
bWluZy9jbGVhbnVwLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
