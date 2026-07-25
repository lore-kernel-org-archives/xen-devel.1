Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E7C531F9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 09:49:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370556.1618640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ06-0003eA-0f; Sat, 25 Jul 2026 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370556.1618640; Sat, 25 Jul 2026 09:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ05-0003e3-RT; Sat, 25 Jul 2026 09:48:57 +0000
Received: by outflank-mailman (input) for mailman id 1370556;
 Sat, 25 Jul 2026 09:48:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wnZ04-0003de-QW
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 09:48:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnZ04-003Tyx-0E
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 11:48:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a648620-bab6-0a2a0a5309dd-0a2a450a9dce-32
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:48:55 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a648686-f2d2-0a2a450a0019-aa0a817c729f-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:48:55 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-hS19_nqnPV-v5GQmSfJy_w-1; Sat,
 25 Jul 2026 05:48:50 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 61DA919540CA; Sat, 25 Jul 2026 09:48:47 +0000 (UTC)
Received: from localhost (unknown [10.44.22.7])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9ED03180049F; Sat, 25 Jul 2026 09:48:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784972934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPp6/Iz6emP9faagVMHidtrIEEZa8zoC+YjDWgEts3k=;
	b=WZAjdlbIX9qW/vnhIMoVW8P1fbgxdtlfEzwOiSL0U1iC24U/zlhK4fbMv3ygS5zf7Io6x3
	EXVu8OM9qB0NrXtM0sA9UmXHkhvRjK6kVXPJ/5brpVvt7ktvrcmEECssfuKWycqte98+Ik
	ah/12j/60crB9zabXgyUqWrSuF5rfmQ=
X-MC-Unique: hS19_nqnPV-v5GQmSfJy_w-1
X-Mimecast-MFC-AGG-ID: hS19_nqnPV-v5GQmSfJy_w_1784972928
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sat, 25 Jul 2026 13:48:32 +0400
Subject: [PATCH v2 1/8] monitor: annotate monitor_qmp_dispatcher_pop_any()
 as coroutine
MIME-Version: 1.0
Message-Id: <20260725-co-v2-1-d3552ddb3931@redhat.com>
References: <20260725-co-v2-0-d3552ddb3931@redhat.com>
In-Reply-To: <20260725-co-v2-0-d3552ddb3931@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=u5SYt6HOlXpoYkBe8zmUhNbcCVIM7I1SQQWsPqoY/1g=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqZIZyN05xG4NXEjp7mfqsDyp6EpYKKkClYQD6/
 vLFKlVVeWKJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCamSGcgAKCRDa6OEJdZac
 5bmAD/0etydKiTihIbMRuX/QQ9wrH5bzVGnC+3T31ACvjR4qTcz/43bEIlxz5UP6OLL+J8FdHoY
 /COMIj4ImeEQTd8X6VM6tIgL0lP0Ix3JBRw585jIfUcBtcbe9WBYp8GuBQ/J70zcai5YSbBjqHM
 YcJDYDb0fupMLYz7uMfjEYEt+LMRExfvUZowMek7pLggUHuObZ6PBcMo2KiLk/9BkxYXmfh1Py0
 1VL9qz9VJyrx/9mKA6AMfZAlO7X6w8Uhb4OvPQdS9yaheMGMMNof3XXs/7rMEJp8yu5hw2yGwKV
 tUsWdgRxcW9oikYq1xs8FJGEQuxJcWevVMUKgtOMxvcog53d3aqqDPPxbODdQqaoJh77uUWtx1D
 yj4W1GWLrjNuNMWfW52mst+gwenpI7ERZPzJyjqyKIGq64C1D8hoRUe9SZBfMDvW88CYeoJy6Ox
 AwaNB5CM37R71NilBZZJ8H5kI/MUtOfRopA2tI1rzxTYPuk+2s8SRyajUOzEobyjYVzzJah7xnl
 Fj5LczdvoJoLDlx1Sg4jKKJgUd40UBCFw2k1dmKZAIeGgMP9qHpQl+7Nzu4E4QnzYqRcDNMlZ4Y
 mFu0qczXin1ELgN8KEVORoq5zbeou4KrGwVpb6sgnQGCa2zrR7zGbbLdFpOc3+fxpACvCzuNLVv
 yY86AryIhC9/2WA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ulj6yl0V0PcCTbqT3BKn18j8H1XQpvB3J9nrasX1ehc_1784972928
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784972935-599C1CFC-B50C7060/0/0
X-purgate-type: clean
X-purgate-size: 861

The function calls qemu_coroutine_yield(), and is called from
monitor_qmp_dispatcher_co().

Fixes: 60f4f62efeb ("monitor: extract request dequeuing to a new function")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 monitor/qmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 223e0643c2ad..338d37cb7e5a 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -342,7 +342,8 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
     return req_obj;
 }
 
-static QMPRequest *monitor_qmp_dispatcher_pop_any(void)
+static QMPRequest * coroutine_fn
+monitor_qmp_dispatcher_pop_any(void)
 {
     while (true) {
         /*

-- 
2.55.0


